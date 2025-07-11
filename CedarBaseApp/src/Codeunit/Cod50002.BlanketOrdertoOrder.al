codeunit 50002 "Blanket Order to Order"
{
    TableNo = "Sales Header";

    trigger OnRun()
    var
        Cust: Record Customer;
        TempSalesLine: Record "Sales Line" temporary;
        SalesCommentLine: Record "Sales Comment Line";
        ATOLink: Record "Assemble-to-Order Link";
        PrepmtMgt: Codeunit "Prepayment Mgt.";
        RecordLinkManagement: Codeunit "Record Link Management";
        SalesCalcDiscountByType: Codeunit "Sales - Calc Discount By Type";
        SalesLineReserve: Codeunit "Sales Line-Reserve";
        Reservation: Page Reservation;
        ShouldRedistributeInvoiceAmount: Boolean;
        CreditLimitExceeded: Boolean;
        IsHandled: Boolean;
    begin
        Rec.TestField("Document Type", Rec."Document Type"::"Blanket Order");
        ShouldRedistributeInvoiceAmount := SalesCalcDiscountByType.ShouldRedistributeInvoiceDiscountAmount(Rec);

        Cust.Get(Rec."Sell-to Customer No.");
        Cust.CheckBlockedCustOnDocs(Cust, Rec."Document Type"::Order, true, false);

        Rec.ValidateSalesPersonOnSalesHeader(Rec, true, false);

        Rec.CheckForBlockedLines;

        if Rec.QtyToShipIsZero then
            Error(Text002);

        SalesSetup.Get();

        CheckAvailability(Rec);

        CreditLimitExceeded := CreateSalesHeader(Rec, Cust."Prepayment %");

        BlanketOrderSalesLine.Reset();
        BlanketOrderSalesLine.SetRange("Document Type", Rec."Document Type");
        BlanketOrderSalesLine.SetRange("Document No.", Rec."No.");
        BlanketOrderSalesLine.SetRange(Group, GGroup);
        BlanketOrderSalesLine.SetFilter("Qty. to Ship", '>0');
        BlanketOrderSalesLine.SetRange("Carriage Line", false);
        if BlanketOrderSalesLine.FindSet then begin
            TempSalesLine.DeleteAll();
            repeat
                if (BlanketOrderSalesLine.Type = BlanketOrderSalesLine.Type::" ") or (BlanketOrderSalesLine."Qty. to Ship" <> 0) then begin
                    SalesLine.SetCurrentKey("Document Type", "Blanket Order No.", "Blanket Order Line No.");
                    SalesLine.SetRange("Blanket Order No.", BlanketOrderSalesLine."Document No.");
                    SalesLine.SetRange("Blanket Order Line No.", BlanketOrderSalesLine."Line No.");
                    QuantityOnOrders := 0;
                    if SalesLine.FindSet then
                        repeat
                            if (SalesLine."Document Type" = SalesLine."Document Type"::"Return Order") or
                               ((SalesLine."Document Type" = SalesLine."Document Type"::"Credit Memo") and
                                (SalesLine."Return Receipt No." = ''))
                            then
                                QuantityOnOrders := QuantityOnOrders - SalesLine."Outstanding Qty. (Base)"
                            else
                                if (SalesLine."Document Type" = SalesLine."Document Type"::Order) or
                                   ((SalesLine."Document Type" = SalesLine."Document Type"::Invoice) and
                                    (SalesLine."Shipment No." = ''))
                                then
                                    QuantityOnOrders := QuantityOnOrders + SalesLine."Outstanding Qty. (Base)";
                        until SalesLine.Next() = 0;

                    CheckBlanketOrderLineQuantity();

                    SalesOrderLine := BlanketOrderSalesLine;
                    ResetQuantityFields(SalesOrderLine);
                    SalesOrderLine."Document Type" := SalesOrderHeader."Document Type";
                    SalesOrderLine."Document No." := SalesOrderHeader."No.";
                    SalesOrderLine."Blanket Order No." := Rec."No.";
                    SalesOrderLine."Blanket Order Line No." := BlanketOrderSalesLine."Line No.";
                    if (SalesOrderLine."No." <> '') and (SalesOrderLine.Type <> SalesOrderLine.Type::" ") then begin
                        SalesOrderLine.Amount := 0;
                        SalesOrderLine."Amount Including VAT" := 0;
                        SalesOrderLineValidateQuantity(SalesOrderLine, BlanketOrderSalesLine);
                        SalesOrderLine.Validate("Shipment Date", BlanketOrderSalesLine."Shipment Date");
                        SalesOrderLine.Validate("Unit Price", BlanketOrderSalesLine."Unit Price");
                        SalesOrderLine."Allow Invoice Disc." := BlanketOrderSalesLine."Allow Invoice Disc.";
                        SalesOrderLine."Allow Line Disc." := BlanketOrderSalesLine."Allow Line Disc.";
                        SalesOrderLine.Validate("Line Discount %", BlanketOrderSalesLine."Line Discount %");
                        if SalesOrderLine.Quantity <> 0 then
                            SalesOrderLine.Validate("Inv. Discount Amount", BlanketOrderSalesLine."Inv. Discount Amount");
                        SalesLineReserve.TransferSaleLineToSalesLine(
                          BlanketOrderSalesLine, SalesOrderLine, BlanketOrderSalesLine."Qty. to Ship (Base)");
                    end;

                    if Cust."Prepayment %" <> 0 then
                        SalesOrderLine."Prepayment %" := Cust."Prepayment %";
                    PrepmtMgt.SetSalesPrepaymentPct(SalesOrderLine, SalesOrderHeader."Posting Date");
                    SalesOrderLine.Validate("Prepayment %");

                    SalesOrderLine."Shortcut Dimension 1 Code" := BlanketOrderSalesLine."Shortcut Dimension 1 Code";
                    SalesOrderLine."Shortcut Dimension 2 Code" := BlanketOrderSalesLine."Shortcut Dimension 2 Code";
                    SalesOrderLine."Dimension Set ID" := BlanketOrderSalesLine."Dimension Set ID";
                    if ATOLink.AsmExistsForSalesLine(BlanketOrderSalesLine) then begin
                        SalesOrderLine."Qty. to Assemble to Order" := SalesOrderLine.Quantity;
                        SalesOrderLine."Qty. to Asm. to Order (Base)" := SalesOrderLine."Quantity (Base)";
                    end;
                    SalesOrderLine.DefaultDeferralCode;
                    if IsSalesOrderLineToBeInserted(SalesOrderLine) then begin
                        SalesOrderLine.Insert();
                    end;

                    if ATOLink.AsmExistsForSalesLine(BlanketOrderSalesLine) then
                        ATOLink.MakeAsmOrderLinkedToSalesOrderLine(BlanketOrderSalesLine, SalesOrderLine);

                    IsHandled := false;
                    if not IsHandled then
                        if BlanketOrderSalesLine."Qty. to Ship" <> 0 then begin
                            BlanketOrderSalesLine.Validate("Qty. to Ship", 0);
                            BlanketOrderSalesLine.Modify();
                            AutoReserve(SalesOrderLine, TempSalesLine);
                        end;
                    if SalesOrderHeader."Shipment Date" = 0D then begin
                        SalesOrderHeader.Validate("Shipment Date", SalesOrderLine."Shipment Date");
                        if SalesOrderLine."Invoice Date" <> 0D then begin
                            SalesOrderHeader.Validate("Posting Date", SalesOrderLine."Invoice Date");
                            SalesOrderHeader.Validate("Document Date", SalesOrderLine."Invoice Date");
                        end;
                        SalesOrderHeader.Modify();
                    end;
                end;
            until BlanketOrderSalesLine.Next() = 0;
        end;


        if SalesSetup."Default Posting Date" = SalesSetup."Default Posting Date"::"No Date" then begin
            SalesOrderHeader."Posting Date" := 0D;
            SalesOrderHeader.Modify();
        end;

        if SalesSetup."Copy Comments Blanket to Order" then begin
            SalesCommentLine.CopyComments(
              SalesCommentLine."Document Type"::"Blanket Order".AsInteger(), SalesOrderHeader."Document Type".AsInteger(), Rec."No.", SalesOrderHeader."No.");
            RecordLinkManagement.CopyLinks(Rec, SalesOrderHeader);
        end;

        if not (ShouldRedistributeInvoiceAmount or SalesSetup."Calc. Inv. Discount") then
            SalesCalcDiscountByType.ResetRecalculateInvoiceDisc(SalesOrderHeader);

        if (not HideValidationDialog) and (not CreditLimitExceeded) then
            CustCheckCreditLimit.BlanketSalesOrderToOrderCheck(SalesOrderHeader);
        Commit();

        if GuiAllowed then
            if TempSalesLine.Find('-') then
                if Confirm(Text003, true) then
                    repeat
                        Clear(Reservation);
                        Reservation.SetReservSource(TempSalesLine);
                        Reservation.RunModal();
                        Rec.Find;
                    until TempSalesLine.Next() = 0;

        Clear(CustCheckCreditLimit);
        Clear(ItemCheckAvail);
    end;

    var
        QuantityCheckErr: Label '%1 of %2 %3 in %4 %5 cannot be more than %6.\%7\%8 - %9 = %6.', Comment = '%1: FIELDCAPTION("Qty. to Ship (Base)"); %2: Field(Type); %3: Field(No.); %4: FIELDCAPTION("Line No."); %5: Field(Line No.); %6: Decimal Qty Difference; %7: Text001; %8: Field(Outstanding Qty. (Base)); %9: Decimal Quantity On Orders';
        Text001: Label '%1 - Unposted %1 = Possible %2';
        BlanketOrderSalesLine: Record "Sales Line";
        SalesLine: Record "Sales Line";
        SalesOrderHeader: Record "Sales Header";
        SalesOrderLine: Record "Sales Line";
        SalesSetup: Record "Sales & Receivables Setup";
        CustCheckCreditLimit: Codeunit "Cust-Check Cr. Limit";
        ItemCheckAvail: Codeunit "Item-Check Avail.";
        UOMMgt: Codeunit "Unit of Measure Management";
        QuantityOnOrders: Decimal;
        Text002: Label 'There is nothing to create.';
        Text003: Label 'Full automatic reservation was not possible.\Reserve items manually?';

    var
        HideValidationDialog: Boolean;

    local procedure SalesOrderLineValidateQuantity(var SalesOrderLine: Record "Sales Line"; BlanketOrderSalesLine: Record "Sales Line")
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        if IsHandled then
            exit;

        SalesOrderLine.Validate(Quantity, BlanketOrderSalesLine."Qty. to Ship");
    end;

    local procedure CheckBlanketOrderLineQuantity()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        if IsHandled then
            exit;

        if (Abs(BlanketOrderSalesLine."Qty. to Ship (Base)" + QuantityOnOrders +
              BlanketOrderSalesLine."Qty. Shipped (Base)") >
            Abs(BlanketOrderSalesLine."Quantity (Base)")) or
           (BlanketOrderSalesLine."Quantity (Base)" * BlanketOrderSalesLine."Outstanding Qty. (Base)" < 0)
        then
            Error(
              QuantityCheckErr,
              BlanketOrderSalesLine.FieldCaption("Qty. to Ship (Base)"),
              BlanketOrderSalesLine.Type, BlanketOrderSalesLine."No.",
              BlanketOrderSalesLine.FieldCaption("Line No."), BlanketOrderSalesLine."Line No.",
              BlanketOrderSalesLine."Outstanding Qty. (Base)" - QuantityOnOrders,
              StrSubstNo(
                Text001,
                BlanketOrderSalesLine.FieldCaption("Outstanding Qty. (Base)"),
                BlanketOrderSalesLine.FieldCaption("Qty. to Ship (Base)")),
              BlanketOrderSalesLine."Outstanding Qty. (Base)", QuantityOnOrders);
    end;

    local procedure CreateSalesHeader(SalesHeader: Record "Sales Header"; PrepmtPercent: Decimal) CreditLimitExceeded: Boolean
    begin
        SalesOrderHeader := SalesHeader;
        SalesOrderHeader."Document Type" := SalesOrderHeader."Document Type"::Order;
        if not HideValidationDialog then
            CreditLimitExceeded := CustCheckCreditLimit.SalesHeaderCheck(SalesOrderHeader);

        SalesOrderHeader."No. Printed" := 0;
        SalesOrderHeader.Status := SalesOrderHeader.Status::Open;
        SalesOrderHeader."No." := '';

        SalesOrderLine.LockTable();
        SalesOrderHeader.Insert(true);

        if SalesHeader."Order Date" = 0D then
            SalesOrderHeader."Order Date" := WorkDate
        else
            SalesOrderHeader."Order Date" := SalesHeader."Order Date";
        if SalesHeader."Posting Date" <> 0D then
            SalesOrderHeader."Posting Date" := SalesHeader."Posting Date";
        if SalesOrderHeader."Posting Date" = 0D then
            SalesOrderHeader."Posting Date" := WorkDate;

        SalesOrderHeader.InitFromSalesHeader(SalesHeader);
        SalesOrderHeader.Validate("Posting Date");
        SalesOrderHeader."Outbound Whse. Handling Time" := SalesHeader."Outbound Whse. Handling Time";
        SalesOrderHeader.Reserve := SalesHeader.Reserve;

        SalesOrderHeader."Prepayment %" := PrepmtPercent;
        SalesOrderHeader.Modify();
    end;


    local procedure ResetQuantityFields(var TempSalesLine: Record "Sales Line")
    begin
        TempSalesLine.Quantity := 0;
        TempSalesLine."Quantity (Base)" := 0;
        TempSalesLine."Qty. Shipped Not Invoiced" := 0;
        TempSalesLine."Quantity Shipped" := 0;
        TempSalesLine."Quantity Invoiced" := 0;
        TempSalesLine."Qty. Shipped Not Invd. (Base)" := 0;
        TempSalesLine."Qty. Shipped (Base)" := 0;
        TempSalesLine."Qty. Invoiced (Base)" := 0;
        TempSalesLine."Outstanding Quantity" := 0;
        TempSalesLine."Outstanding Qty. (Base)" := 0;
    end;

    procedure GetSalesOrderHeader(var SalesHeader: Record "Sales Header")
    begin
        SalesHeader := SalesOrderHeader;
    end;

    procedure SetHideValidationDialog(NewHideValidationDialog: Boolean)
    begin
        HideValidationDialog := NewHideValidationDialog;
    end;

    local procedure AutoReserve(var SalesLine: Record "Sales Line"; var TempSalesLine: Record "Sales Line" temporary)
    var
        ReservMgt: Codeunit "Reservation Management";
        FullAutoReservation: Boolean;
    begin
        if (SalesLine.Type = SalesLine.Type::Item) and
           (SalesLine.Reserve = SalesLine.Reserve::Always) and
           (SalesLine."No." <> '')
        then begin
            SalesLine.TestField("Shipment Date");
            ReservMgt.SetReservSource(SalesLine);
            ReservMgt.AutoReserve(FullAutoReservation, '', SalesLine."Shipment Date", SalesLine."Qty. to Ship", SalesLine."Qty. to Ship (Base)");
            SalesLine.Find;
            if not FullAutoReservation then begin
                TempSalesLine.TransferFields(SalesLine);
                TempSalesLine.Insert();
            end;
        end;
    end;

    local procedure CheckAvailability(BlanketOrderSalesHeader: Record "Sales Header")
    var
        ATOLink: Record "Assemble-to-Order Link";
    begin
        BlanketOrderSalesLine.SetRange("Document Type", BlanketOrderSalesHeader."Document Type");
        BlanketOrderSalesLine.SetRange("Document No.", BlanketOrderSalesHeader."No.");
        BlanketOrderSalesLine.SetRange(Type, BlanketOrderSalesLine.Type::Item);
        BlanketOrderSalesLine.SetFilter("No.", '<>%1', '');
        if BlanketOrderSalesLine.FindSet then
            repeat
                if BlanketOrderSalesLine."Qty. to Ship" > 0 then begin
                    SalesLine := BlanketOrderSalesLine;
                    ResetQuantityFields(SalesLine);
                    SalesLine.Quantity := BlanketOrderSalesLine."Qty. to Ship";
                    SalesLine."Quantity (Base)" := Round(SalesLine.Quantity * SalesLine."Qty. per Unit of Measure", UOMMgt.QtyRndPrecision);
                    SalesLine."Qty. to Ship" := SalesLine.Quantity;
                    SalesLine."Qty. to Ship (Base)" := SalesLine."Quantity (Base)";
                    SalesLine.InitOutstanding;
                    if ATOLink.AsmExistsForSalesLine(BlanketOrderSalesLine) then begin
                        SalesLine."Qty. to Assemble to Order" := SalesLine.Quantity;
                        SalesLine."Qty. to Asm. to Order (Base)" := SalesLine."Quantity (Base)";
                        SalesLine."Outstanding Quantity" -= SalesLine."Qty. to Assemble to Order";
                        SalesLine."Outstanding Qty. (Base)" -= SalesLine."Qty. to Asm. to Order (Base)";
                    end;
                    if SalesLine.Reserve <> SalesLine.Reserve::Always then
                        if not HideValidationDialog then
                            if ItemCheckAvail.SalesLineCheck(SalesLine) then
                                ItemCheckAvail.RaiseUpdateInterruptedError;
                end;
            until BlanketOrderSalesLine.Next() = 0;
    end;




    local procedure IsSalesOrderLineToBeInserted(SalesOrderLine: Record "Sales Line"): Boolean
    var
        AttachedToSalesLine: Record "Sales Line";
    begin
        if SalesOrderLine."Attached to Line No." = 0 then
            exit(true);
        exit(
          AttachedToSalesLine.Get(
            SalesOrderLine."Document Type", SalesOrderLine."Document No.", SalesOrderLine."Attached to Line No."));
    end;



    procedure SetGroup(Lgroup: Integer)
    begin
        GGroup := Lgroup;
    end;

    var
        GGroup: Integer;
}

