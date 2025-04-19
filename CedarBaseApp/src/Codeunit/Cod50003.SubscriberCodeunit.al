codeunit 50003 "Subscriber Codeunit"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Page, 132, 'OnBeforeActionEvent', 'CancelInvoice', true, true)]
    local procedure OnBeforeActionEventCancelInvoice(var Rec: Record "Sales Invoice Header")
    var
        Cust: Record Customer;
    begin
        Cust.Get(Rec."Sell-to Customer No.");
        Cust.SetUserDivision(Cust);
        Commit();
    end;



    [EventSubscriber(ObjectType::Page, 132, 'OnBeforeActionEvent', 'CorrectInvoice', true, true)]
    local procedure OnBeforeActionEventCorrectInvoice(var Rec: Record "Sales Invoice Header")
    var
        Cust: Record Customer;
    begin
        Cust.Get(Rec."Sell-to Customer No.");
        Cust.SetUserDivision(Cust);
        Commit();
    end;


    [EventSubscriber(ObjectType::Page, 132, 'OnBeforeActionEvent', 'CreateCreditMemo', true, true)]
    local procedure OnBeforeActionEventCreateCredMemo(var Rec: Record "Sales Invoice Header")
    var
        Cust: Record Customer;
    begin
        Cust.Get(Rec."Sell-to Customer No.");
        Cust.SetUserDivision(Cust);
    end;

    [EventSubscriber(ObjectType::Page, 138, 'OnBeforeActionEvent', 'CancelInvoice', true, true)]
    local procedure OnBeforeActionEventCancelInvoicePur(var Rec: Record "Purch. Inv. Header")
    var
        Vend: Record Vendor;
    begin
        Vend.Get(Rec."Buy-from Vendor No.");
        Vend.SetUserDivision(Vend);
        Commit();
    end;



    [EventSubscriber(ObjectType::Page, 138, 'OnBeforeActionEvent', 'CorrectInvoice', true, true)]
    local procedure OnBeforeActionEventCorrectInvoicePur(var Rec: Record "Purch. Inv. Header")
    var
        Vend: Record Vendor;
    begin
        Vend.Get(Rec."Buy-from Vendor No.");
        Vend.SetUserDivision(Vend);
        Commit();
    end;


    [EventSubscriber(ObjectType::Page, 138, 'OnBeforeActionEvent', 'CreateCreditMemo', true, true)]
    local procedure OnBeforeActionEventCreateCredMemoPur(var Rec: Record "Purch. Inv. Header")
    var
        Vend: Record Vendor;
    begin
        Vend.Get(Rec."Buy-from Vendor No.");
        Vend.SetUserDivision(Vend);
    end;

    [EventSubscriber(ObjectType::Page, 143, 'OnBeforeActionEvent', 'CancelInvoice', true, true)]
    local procedure OnBeforeActionEventCancelInvoiceSList(var Rec: Record "Sales Invoice Header")
    var
        Cust: Record Customer;
    begin
        Cust.Get(Rec."Sell-to Customer No.");
        Cust.SetUserDivision(Cust);
        Commit();
    end;



    [EventSubscriber(ObjectType::Page, 143, 'OnBeforeActionEvent', 'CorrectInvoice', true, true)]
    local procedure OnBeforeActionEventCorrectInvoiceSList(var Rec: Record "Sales Invoice Header")
    var
        Cust: Record Customer;
    begin
        Cust.Get(Rec."Sell-to Customer No.");
        Cust.SetUserDivision(Cust);
        Commit();
    end;


    [EventSubscriber(ObjectType::Page, 143, 'OnBeforeActionEvent', 'CreateCreditMemo', true, true)]
    local procedure OnBeforeActionEventCreateCredMemoSList(var Rec: Record "Sales Invoice Header")
    var
        Cust: Record Customer;
    begin
        Cust.Get(Rec."Sell-to Customer No.");
        Cust.SetUserDivision(Cust);
    end;

    [EventSubscriber(ObjectType::Page, 146, 'OnBeforeActionEvent', 'CancelInvoice', true, true)]
    local procedure OnBeforeActionEventCancelInvoicePurList(var Rec: Record "Purch. Inv. Header")
    var
        Vend: Record Vendor;
    begin
        Vend.Get(Rec."Buy-from Vendor No.");
        Vend.SetUserDivision(Vend);
        Commit();
    end;



    [EventSubscriber(ObjectType::Page, 146, 'OnBeforeActionEvent', 'CorrectInvoice', true, true)]
    local procedure OnBeforeActionEventCorrectInvoicePurList(var Rec: Record "Purch. Inv. Header")
    var
        Vend: Record Vendor;
    begin
        Vend.Get(Rec."Buy-from Vendor No.");
        Vend.SetUserDivision(Vend);
        Commit();
    end;


    [EventSubscriber(ObjectType::Page, 146, 'OnBeforeActionEvent', 'CreateCreditMemo', true, true)]
    local procedure OnBeforeActionEventCreateCredMemoPurList(var Rec: Record "Purch. Inv. Header")
    var
        Vend: Record Vendor;
    begin
        Vend.Get(Rec."Buy-from Vendor No.");
        Vend.SetUserDivision(Vend);
    end;


    [EventSubscriber(ObjectType::Codeunit, 80, 'OnBeforePostSalesDoc', '', true, true)]
    local procedure OnBeforePostSalesDoc(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean)
    var
        USetup: Record "User Setup";
        RCust: Record Customer;
    begin
        if SalesHeader."Document Type" IN [SalesHeader."Document Type"::"Blanket Order", SalesHeader."Document Type"::Order, SalesHeader."Document Type"::Invoice] then
            SalesHeader.TestField(Status, SalesHeader.Status::Released);

        CheckSalesHeaderLineDimesnion(SalesHeader);

        if Not PreviewMode then begin
            USetup.Get(UserId);
            RCust.Get(SalesHeader."Sell-to Customer No.");
            USetup."Division Code" := RCust."Global Dimension 1 Code";
            USetup.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 80, 'OnBeforeUpdatePostingNo', '', true, true)]

    local procedure OnBeforeUpdatePostingNo(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean)
    var
        USetup: Record "User Setup";
        RCust: Record Customer;
    begin
        if Not PreviewMode then begin
            USetup.Get(UserId);
            RCust.Get(SalesHeader."Sell-to Customer No.");
            USetup."Division Code" := RCust."Global Dimension 1 Code";
            USetup.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 414, 'OnBeforeReleaseSalesDoc', '', True, True)]
    local procedure OnBeforeManualReleaseSalesDoc(VAR SalesHeader: Record "Sales Header"; PreviewMode: Boolean)
    Var
        Cust: Record Customer;
        SalesRecSetup: Record "Sales & Receivables Setup";
    begin
        if Not PreviewMode then begin
            SalesRecSetup.Get;
            Cust.get(SalesHeader."Sell-to Customer No.");
            if Cust."Carriage %" <> 0 then
                SalesRecSetup.TestField("Carriage Account");
            TestCustomerDefaultDim(SalesHeader);
            CheckSalesHeaderLineDimesnion(SalesHeader);
        end;
    end;

    local procedure TestCustomerDefaultDim(SalHeader: Record "Sales Header")
    var
        DefaultDim: Record "Default Dimension";
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.get;
        DefaultDim.get(18, SalHeader."Sell-to Customer No.", GLSetup."Global Dimension 1 Code");
        if DefaultDim."Dimension Value Code" <> SalHeader."Shortcut Dimension 1 Code" then
            Error('Customer Default Dimesnsion %1 is not Matching the Sales %2 Dimension %3', DefaultDim."Dimension Value Code", Format(SalHeader."Document Type"), SalHeader."Shortcut Dimension 1 Code");
    end;

    [EventSubscriber(ObjectType::Codeunit, 415, 'OnBeforeReleasePurchaseDoc', '', True, True)]
    local procedure OnBeforeReleasePurchDoc(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean)
    var
        DefaultDim: Record "Default Dimension";
        GLSetup: Record "General Ledger Setup";
    begin
        if Not PreviewMode then begin
            GLSetup.get;
            DefaultDim.get(23, PurchaseHeader."Buy-from Vendor No.", GLSetup."Global Dimension 1 Code");
            if DefaultDim."Dimension Value Code" <> PurchaseHeader."Shortcut Dimension 1 Code" then
                Error('Vendor Default Dimesnsion %1 is not Matching the Purchase %2 Dimension %3', DefaultDim."Dimension Value Code", Format(PurchaseHeader."Document Type"), PurchaseHeader."Shortcut Dimension 1 Code");
        end;
        CheckpurchaseHeaderLineDimesnion(PurchaseHeader);
    end;


    [EventSubscriber(ObjectType::Codeunit, 414, 'OnAfterReleaseSalesDoc', '', True, True)]
    local procedure OnAfterManualReleaseSalesDoc(VAR SalesHeader: Record "Sales Header"; PreviewMode: Boolean)
    Var
        Cust: Record Customer;

    begin
        if Not PreviewMode then begin
            if SalesHeader."Document Type" IN [SalesHeader."Document Type"::Order, SalesHeader."Document Type"::Invoice, SalesHeader."Document Type"::"Blanket Order"] then begin
                Cust.get(SalesHeader."Sell-to Customer No.");
                if Cust."Carriage %" <> 0 then
                    CreateCarriageLine(SalesHeader, Cust."Carriage %");

            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 414, 'OnAfterReopenSalesDoc', '', True, True)]
    local procedure OnAfterReopenSalesDoc(VAR SalesHeader: Record "Sales Header"; PreviewMode: Boolean)
    Var
        Cust: Record Customer;
        SalesLine: Record "Sales Line";
        DocumentTotals: Codeunit "Document Totals";
    begin
        if Not PreviewMode then begin
            if SalesHeader."Document Type" IN [SalesHeader."Document Type"::Order, SalesHeader."Document Type"::Invoice, SalesHeader."Document Type"::"Blanket Order"] then begin
                SalesLine.Reset();
                SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                SalesLine.SetRange("Document No.", SalesHeader."No.");
                SalesLine.SetRange("Carriage Line", true);
                if SalesLine.FindFirst() then
                    SalesLine.Delete(true);
                DocumentTotals.RefreshSalesLine(SalesLine);
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, 37, 'OnAfterValidateEvent', 'No.', True, true)]
    local procedure OnAfterValidateEvent(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CurrFieldNo: Integer)
    var
        DefDimCust: Record "Default Dimension";
        SalesRecvSetup: Record "Sales & Receivables Setup";
        DefDimItem: Record "Default Dimension";
        GlSetup: Record "General Ledger Setup";
        DimValue: Record "Dimension Value";
        ValFilter: Text[250];
        IsItemDimOK: Boolean;
    begin
        SalesRecvSetup.Get;
        if Not SalesRecvSetup."Check Def. Dimension on Order" then
            exit;

        GlSetup.get;
        If Not DefDimCust.get(18, Rec."Sell-to Customer No.", GlSetup."Global Dimension 1 Code") then
            Error('Defualt Dimesnion for Customer Does not Exist');

        if Rec.Type <> Rec.Type::Item then
            exit;
        If Not DefDimItem.get(27, Rec."No.", GlSetup."Global Dimension 1 Code") then
            Error('Defualt Dimesnion for Product No. %1 Does not Exist', Rec."No.");
        Clear(IsItemDimOK);
        if DefDimCust."Allowed Values Filter" <> '' then begin
            ValFilter := DefDimCust."Allowed Values Filter";
            DimValue.SetRange("Dimension Code", DefDimCust."Dimension Code");
            DimValue.SetFilter(Code, ValFilter);
            if DimValue.FindSet() then
                repeat
                    if DefDimItem."Dimension Value Code" = DimValue.Code then
                        IsItemDimOK := true;
                until (DimValue.Next() = 0) OR (IsItemDimOK);
            if Not IsItemDimOK then
                Error('Product Dimension %1 is not within range of allowed Dimensions for Customer', DefDimItem."Dimension Value Code");
        end else
            if DefDimCust."Dimension Value Code" <> DefDimItem."Dimension Value Code" then
                Error('Customer Dimesnion %1 is not matching with Product Dimension %2', DefDimCust."Dimension Value Code", DefDimItem."Dimension Value Code");
    end;




    [EventSubscriber(ObjectType::Table, 39, 'OnAfterValidateEvent', 'No.', True, true)]
    local procedure OnAfterValidateEventP(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line"; CurrFieldNo: Integer)
    var
        DefDimCust: Record "Default Dimension";
        SalesRecvSetup: Record "Sales & Receivables Setup";
        DefDimItem: Record "Default Dimension";
        GlSetup: Record "General Ledger Setup";
        DimValue: Record "Dimension Value";
        ValFilter: Text[250];
        IsItemDimOK: Boolean;
    begin
        SalesRecvSetup.Get;
        if Not SalesRecvSetup."Check Def. Dimension on Order" then
            exit;

        GlSetup.get;
        If Not DefDimCust.get(23, Rec."Buy-from Vendor No.", GlSetup."Global Dimension 1 Code") then
            Error('Defualt Dimesnion for Vendor Does not Exist');

        if Rec.Type <> Rec.Type::Item then
            exit;
        If Not DefDimItem.get(27, Rec."No.", GlSetup."Global Dimension 1 Code") then
            Error('Defualt Dimesnion for Product No. %1 Does not Exist', Rec."No.");
        Clear(IsItemDimOK);
        if DefDimCust."Allowed Values Filter" <> '' then begin
            ValFilter := DefDimCust."Allowed Values Filter";
            DimValue.SetRange("Dimension Code", DefDimCust."Dimension Code");
            DimValue.SetFilter(Code, ValFilter);
            if DimValue.FindSet() then
                repeat
                    if DefDimItem."Dimension Value Code" = DimValue.Code then
                        IsItemDimOK := true;
                until (DimValue.Next() = 0) OR (IsItemDimOK);
            if Not IsItemDimOK then
                Error('Product Dimension %1 is not within range of allowed Dimensions for Vendor', DefDimItem."Dimension Value Code");
        End Else
            if DefDimCust."Dimension Value Code" <> DefDimItem."Dimension Value Code" then
                Error('Vendor Dimesnion %1 is not matching with Product Dimension %2', DefDimCust."Dimension Value Code", DefDimItem."Dimension Value Code");
    end;

    local procedure CreateCarriageLine(SalesHeader: Record "Sales Header"; Prcnt: Decimal)
    var
        SalesRecSetup: Record "Sales & Receivables Setup";
        SalesLine: Record "Sales Line";
        LineNo: Integer;
        CarriageAmt: Decimal;
        DocumentTotals: Codeunit "Document Totals";
    begin
        SalesRecSetup.Get();
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetRange(Type, SalesLine.Type::"G/L Account");
        SalesLine.SetRange("No.", SalesRecSetup."Carriage Account");
        SalesLine.SuspendStatusCheck(true);
        SalesLine.DeleteAll();
        SalesHeader.CalcFields(Amount);
        CarriageAmt := Round((SalesHeader.Amount * Prcnt) / 100);
        SalesLine.SetRange(Type);
        SalesLine.SetRange("No.");
        if SalesLine.FindLast() then
            LineNo := SalesLine."Line No." + 10000;


        SalesLine.Init();
        SalesLine."Document Type" := SalesHeader."Document Type";
        SalesLine."Document No." := SalesHeader."No.";
        SalesLine."Line No." := LineNo;
        SalesLine.Validate(Type, SalesLine.Type::"G/L Account");
        SalesLine.Validate("No.", SalesRecSetup."Carriage Account");
        SalesLine.Validate(Quantity, 1);
        SalesLine.Validate("Unit Price", CarriageAmt);
        SalesLine."Carriage Line" := true;
        SalesLine.Insert(true);
        DocumentTotals.RefreshSalesLine(SalesLine);

    end;

    local procedure CheckpurchaseHeaderLineDimesnion(PurchaseHeader: Record "Purchase Header")
    var
        PurchLine: Record "Purchase Line";
    begin
        PurchLine.Reset();
        PurchLine.SetRange("Document Type", PurchaseHeader."Document Type");
        PurchLine.SetRange("Document No.", PurchaseHeader."No.");
        PurchLine.SetFilter(Type, '<>%1', PurchLine.Type::" ");
        if PurchLine.FindSet() then
            repeat
                if PurchLine."Shortcut Dimension 1 Code" <> PurchaseHeader."Shortcut Dimension 1 Code" then
                    Error('Purchase %1 Dimesnion %2 is not matching the Purchase Line Dimension %3 in Line No. %4', Format(PurchaseHeader."Document Type"), PurchaseHeader."Shortcut Dimension 1 Code", PurchLine."Shortcut Dimension 1 Code", PurchLine."Line No.");
            until PurchLine.Next() = 0;
    end;

    local procedure CheckSalesHeaderLineDimesnion(SalesHeader: Record "Sales Header")
    var
        SalLine: Record "Sales Line";
    begin
        SalLine.Reset();
        SalLine.SetRange("Document Type", SalesHeader."Document Type");
        SalLine.SetRange("Document No.", SalesHeader."No.");
        SalLine.SetFilter(Type, '<>%1', SalLine.Type::" ");
        if SalLine.FindSet() then
            repeat
                if SalLine."Shortcut Dimension 1 Code" <> SalesHeader."Shortcut Dimension 1 Code" then
                    Error('Sales %1 Dimesnion %2 is not matching the Sales Line Dimension %3 in Line No. %4', Format(SalesHeader."Document Type"), SalesHeader."Shortcut Dimension 1 Code", SalLine."Shortcut Dimension 1 Code", SalLine."Line No.");
            until SalLine.Next() = 0;
    end;

    [EventSubscriber(ObjectType::Codeunit, 84, 'OnBeforeRun', '', True, true)]
    local procedure OnBeforeRun(VAR SalesHeader: Record "Sales Header"; VAR IsHandled: Boolean)
    var
        BlanketSalesorderLine: Record "Sales Line";
        OldGroup: Integer;
        BlanketSalesOrderToOrder: Codeunit "Blanket Order to Order";
        FirstSONo: Code[20];
        LastSONo: Code[20];
        SalesHeader2: Record "Sales Header";
        Cnt: Integer;
        OrderCreatedMsg: TextConst ENU = 'Order %1 has been created from blanket order %2.';
        OrderCreatedMsgNew: TextConst ENU = '%1 Sales Order has been created from %2 to %3';
        USetup: Record "User Setup";
        RCust: Record Customer;
        ArchiveManagement: Codeunit ArchiveManagement;
    begin
        IsHandled := true;
        SalesHeader.TESTFIELD("Document Type", SalesHeader."Document Type"::"Blanket Order");
        SalesHeader.TESTFIELD(Status, SalesHeader.Status::Released);
        IF GUIALLOWED THEN
            IF NOT CONFIRM('Do you want to create Sales Orders based on Group from Blanket Sales Order No. %1', FALSE, SalesHeader."No.") THEN
                EXIT;

        Clear(OldGroup);
        Clear(FirstSONo);
        Clear(LastSONo);

        CheckSalesHeaderLineDimesnion(SalesHeader);

        BlanketSalesorderLine.RESET;
        BlanketSalesorderLine.SETCURRENTKEY(Group);
        BlanketSalesorderLine.SETRANGE("Document Type", SalesHeader."Document Type");
        BlanketSalesorderLine.SETRANGE("Document No.", SalesHeader."No.");
        BlanketSalesorderLine.SetRange("Carriage Line", false);
        //BlanketSalesorderLine.SETRange(Group, 0);
        if BlanketSalesorderLine.FindSET() then
            repeat
                IF BlanketSalesorderLine.Group = 0 then
                    Error('Please provide Group in Blanket Order Line No. %1', BlanketSalesorderLine."Line No.");
            // IF BlanketSalesorderLine."Shipment Date" = 0D then
            //     Error('Please provide Shipment Date in Blanket Order Line No. %1', BlanketSalesorderLine."Line No.");
            // IF BlanketSalesorderLine."Invoice Date" = 0D then
            //     Error('Please provide Invoice Date in Blanket Order Line No. %1', BlanketSalesorderLine."Line No.");
            UNTIL BlanketSalesorderLine.Next() = 0;


        BlanketSalesorderLine.RESET;
        BlanketSalesorderLine.SETCURRENTKEY(Group);
        BlanketSalesorderLine.SETRANGE("Document Type", SalesHeader."Document Type");
        BlanketSalesorderLine.SETRANGE("Document No.", SalesHeader."No.");
        BlanketSalesorderLine.SetFilter("Qty. to Ship", '>0');
        BlanketSalesorderLine.SetRange("Carriage Line", false);
        IF BlanketSalesorderLine.FINDSET THEN
            REPEAT
                IF OldGroup <> BlanketSalesorderLine.Group THEN BEGIN
                    USetup.Get(UserId);
                    RCust.Get(SalesHeader."Sell-to Customer No.");
                    USetup."Division Code" := RCust."Global Dimension 1 Code";
                    USetup.Modify();
                    BlanketSalesOrderToOrder.SetGroup(BlanketSalesorderLine.Group);
                    BlanketSalesOrderToOrder.RUN(SalesHeader);
                    BlanketSalesOrderToOrder.GetSalesOrderHeader(SalesHeader2);
                    If FirstSONo = '' then
                        FirstSONo := SalesHeader2."No.";
                    LastSONo := SalesHeader2."No.";
                    Cnt += 1;
                END;
                OldGroup := BlanketSalesorderLine.Group;
            UNTIL BlanketSalesorderLine.NEXT = 0;
        ArchiveManagement.StoreSalesDocument(SalesHeader, false);
        SalesHeader.Completed := true;
        SalesHeader.Modify();

        if FirstSONo = LastSONo then
            MESSAGE(OrderCreatedMsg, SalesHeader2."No.", SalesHeader."No.")
        Else
            Message(OrderCreatedMsgNew, Cnt, FirstSONo, LastSONo);
    end;

    [EventSubscriber(ObjectType::Table, 18, 'OnBeforeCheckBlockedCust', '', false, false)]
    local procedure OnBeforeCheckBlockedCust(Customer: Record Customer; DocType: Option; Shipment: Boolean; Source: Option; Transaction: Boolean; var IsHandled: Boolean)
    var
        Salesdocumenttype: Enum "Sales Document Type";
    begin
        Salesdocumenttype := DocType;
        if Customer."Privacy Blocked" then
            Customer.CustPrivacyBlockedErrorMessage(Customer, Transaction);

        if ((Customer.Blocked in [Customer.Blocked::All, Customer.Blocked::"Credit Control Query", Customer.Blocked::"Customer Service Query"]) or
            ((Customer.Blocked = Customer.Blocked::Invoice) and
             (Salesdocumenttype in [Salesdocumenttype::Quote, Salesdocumenttype::Order, Salesdocumenttype::Invoice, Salesdocumenttype::"Blanket Order"])) or
            ((Customer.Blocked = Customer.Blocked::Ship) and (Salesdocumenttype in [Salesdocumenttype::Quote, Salesdocumenttype::Order, Salesdocumenttype::"Blanket Order"]) and
             (not Transaction)) or
            ((Customer.Blocked = Customer.Blocked::Ship) and (Salesdocumenttype in [Salesdocumenttype::Quote, Salesdocumenttype::Order, Salesdocumenttype::Invoice, Salesdocumenttype::"Blanket Order"]) and
             Shipment and Transaction)) AND (Customer.Blocked <> Customer.Blocked::"Pending Credit")
        then
            Customer.CustBlockedErrorMessage(Customer, Transaction);

    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::NoSeriesManagement, 'OnNoSeriesLineFilterOnBeforeFindLast', '', false, false)]
    local procedure OnNoSeriesLineFilterOnBeforeFindLast(var NoSeriesLine: Record "No. Series Line")
    var
        UserSetup: Record "User Setup";
        DivCode: Code[20];
    begin
        Clear(DivCode);
        UserSetup.Get(UserId);
        DivCode := UserSetup."Division Code";
        if DivCode <> '' then
            NoSeriesLine.SetRange("Division Code", DivCode);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::NoSeriesManagement, 'OnAfterGetNextNo3', '', false, false)]
    local procedure OnAfterGetNextNo3(var NoSeriesLine: Record "No. Series Line"; ModifySeries: Boolean)
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.Get(UserId);
        if UserSetup."Division Code" <> '' then begin
            UserSetup."Division Code" := '';
            UserSetup.Modify();
        End;
    end;


    procedure ItemLookUp(OldItemNo: Code[20]; var NewItemNo: Code[20]; GlobalDimCode: Code[20]; FromSalesDoc: Boolean; SourceNo: Code[20])
    var
        l_Item: Record Item;
        DefaultDim: Record "Default Dimension";
        GlSetup: Record "General Ledger Setup";
        AllowedValFilter: Text[250];
    begin
        GlSetup.get;
        if FromSalesDoc then
            DefaultDim.Get(18, SourceNo, GlSetup."Global Dimension 1 Code")
        else
            DefaultDim.Get(23, SourceNo, GlSetup."Global Dimension 1 Code");
        NewItemNo := '';
        AllowedValFilter := DefaultDim."Allowed Values Filter";
        l_Item.Reset();
        if DefaultDim."Allowed Values Filter" = '' then
            l_Item.SetRange("Global Dimension 1 Code", GlobalDimCode)
        else
            l_Item.SetFilter("Global Dimension 1 Code", AllowedValFilter);
        l_Item."No." := OldItemNo;

        if Page.RunModal(Page::"Item List", l_Item) = Action::LookupOK then
            NewItemNo := l_Item."No.";

    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', false, false)]
    local procedure OnAfterSubstituteReport(ReportId: Integer; var NewReportId: Integer)
    begin
        if ReportId = Report::"Calc. and Post VAT Settlement" then
            NewReportId := Report::"Calc. and Post VAT Settlement2";
    end;

    [EventSubscriber(ObjectType::Table, database::"G/L Entry", 'OnAfterInsertEvent', '', false, false)]
    local procedure CheckDivisionDimensionConsistent(var Rec: Record "G/L Entry")
    var
        GLEntry: Record "G/L Entry";
        CompInfo: Record "Company Information";
    begin
        CompInfo.get();
        if not CompInfo."Check Division Consistent" then
            exit;
        Rec.TestField("Global Dimension 1 Code");
        GLEntry.Reset();
        GLEntry.SetCurrentKey("Document No.");
        GLEntry.SetRange("Document No.", Rec."Document No.");
        if GLEntry.FindFirst() then
            GLEntry.TestField("Global Dimension 1 Code", Rec."Global Dimension 1 Code");


    end;

    [EventSubscriber(ObjectType::Codeunit, 90, 'OnBeforePostPurchaseDoc', '', true, true)]
    local procedure OnBeforePostPurchaseDoc(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean)
    var
        USetup: Record "User Setup";
        RVend: Record Vendor;

    begin
        if PurchaseHeader."Document Type" IN [PurchaseHeader."Document Type"::"Blanket Order", PurchaseHeader."Document Type"::Order, PurchaseHeader."Document Type"::Invoice,
        PurchaseHeader."Document Type"::Quote] then
            PurchaseHeader.TestField(Status, PurchaseHeader.Status::Released);
        CheckpurchaseHeaderLineDimesnion(PurchaseHeader);

        if Not PreviewMode then begin
            USetup.Get(UserId);
            RVend.Get(PurchaseHeader."Buy-from Vendor No.");
            USetup."Division Code" := RVend."Global Dimension 1 Code";
            USetup.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 90, 'OnUpdatePostingNosOnInvoiceOnBeforeSetPostingNo', '', true, true)]

    local procedure OnUpdatePostingNosOnInvoiceOnBeforeSetPostingNo(var PurchHeader: Record "Purchase Header")
    var
        USetup: Record "User Setup";
        RVend: Record Vendor;
    begin
        USetup.Get(UserId);
        RVend.Get(PurchHeader."Buy-from Vendor No.");
        USetup."Division Code" := RVend."Global Dimension 1 Code";
    end;

    [EventSubscriber(ObjectType::Table, 81, 'OnAfterValidateEvent', 'Account No.', True, true)]
    local procedure OnAfterValidateEventAcc(var Rec: Record "Gen. Journal Line"; var xRec: Record "Gen. Journal Line"; CurrFieldNo: Integer)
    var
        GenJrnalBatch: Record "Gen. Journal Batch";
        Cust: Record Customer;
        Vend: Record Vendor;
        BankAcc: Record "Bank Account";
        GLAcc: Record "G/L Account";
        CompInfo: Record "Company Information";
    Begin
        CompInfo.Get;
        if Not CompInfo."Check Division Consistent" then
            exit;
        if (Rec."Journal Template Name" <> '') AND (Rec."Journal Batch Name" <> '') AND (Rec."Account No." <> '') then begin
            GenJrnalBatch.Get(Rec."Journal Template Name", Rec."Journal Batch Name");
            if Rec."Account Type" <> Rec."Account Type"::"G/L Account" then begin//DS 28/10/2021
                if (GenJrnalBatch."Division Code" = '') AND (Not GenJrnalBatch."Skip Division Check") then
                    Error('Please enter Division Code on Journal Batch Name - %1', GenJrnalBatch.Name);
            end;
            //else
            //     if GenJrnalBatch."Division Code" <> '' then
            //         Error('Division Code must be blank in Journal Batch Name - %1 for Account Type G/L', GenJrnalBatch.Name);
            // //DS 28/10/2021
            if GenJrnalBatch."Skip Division Check" then
                exit;

            if (Rec."Account Type" = Rec."Account Type"::Customer) AND (Rec."Account No." <> '') then begin
                Cust.Get(Rec."Account No.");
                Cust.TestField("Global Dimension 1 Code");
                CheckBatchDivisionDimension(GenJrnalBatch."Division Code", Cust."Global Dimension 1 Code");
            end;
            if (Rec."Account Type" = Rec."Account Type"::Vendor) AND (Rec."Account No." <> '') then begin
                Vend.Get(Rec."Account No.");
                Vend.TestField("Global Dimension 1 Code");
                CheckBatchDivisionDimension(GenJrnalBatch."Division Code", Vend."Global Dimension 1 Code");
            end;
            if (Rec."Account Type" = Rec."Account Type"::"Bank Account") AND (Rec."Account No." <> '') then begin
                BankAcc.Get(Rec."Account No.");
                //BankAcc.TestField("Global Dimension 1 Code");
                //CheckBatchDivisionDimension(GenJrnalBatch."Division Code", BankAcc."Global Dimension 1 Code");
                CheckBankBatchDivisionDimension(GenJrnalBatch."Division Code", BankAcc."Global Dimension 1 Code", Rec."Account No.");
            end;
            if (Rec."Account Type" = Rec."Account Type"::"G/L Account") AND (Rec."Account No." <> '') then begin
                GLAcc.Get(Rec."Account No.");
                //GLAcc.TestField("Global Dimension 1 Code");//DS 26/10/2021
                //CheckBatchDivisionDimension(GenJrnalBatch."Division Code", GLAcc."Global Dimension 1 Code");//DS 26/10/2021
                CheckGLBatchDivDimension(GenJrnalBatch, GLAcc."Global Dimension 1 Code", Rec."Account No.");//DS 27/10/2021
            end;
        end;
    End;

    [EventSubscriber(ObjectType::Table, 81, 'OnAfterValidateEvent', 'Bal. Account No.', True, true)]
    local procedure OnAfterValidateEventBalAcc(var Rec: Record "Gen. Journal Line"; var xRec: Record "Gen. Journal Line"; CurrFieldNo: Integer)
    var
        GenJrnalBatch: Record "Gen. Journal Batch";
        Cust: Record Customer;
        Vend: Record Vendor;
        BankAcc: Record "Bank Account";
        GLAcc: Record "G/L Account";
        CompInfo: Record "Company Information";
    Begin
        CompInfo.Get;
        if Not CompInfo."Check Division Consistent" then
            exit;
        if (Rec."Journal Template Name" <> '') AND (Rec."Journal Batch Name" <> '') AND (Rec."Bal. Account No." <> '') then begin
            GenJrnalBatch.Get(Rec."Journal Template Name", Rec."Journal Batch Name");
            if Rec."Bal. Account Type" <> Rec."Bal. Account Type"::"Bank Account" then begin//DS 28/10/2021
                if (GenJrnalBatch."Division Code" = '') AND (Not GenJrnalBatch."Skip Division Check") then
                    Error('Please enter Division Code on Journal Batch Name - %1', GenJrnalBatch.Name);
            end;
            if GenJrnalBatch."Skip Division Check" then
                exit;

            if (Rec."Bal. Account Type" = Rec."Bal. Account Type"::Customer) AND (Rec."Bal. Account No." <> '') then begin
                Cust.Get(Rec."Bal. Account No.");
                Cust.TestField("Global Dimension 1 Code");
                CheckBatchDivisionDimension(GenJrnalBatch."Division Code", Cust."Global Dimension 1 Code");
            end;
            if (Rec."Bal. Account Type" = Rec."Bal. Account Type"::Vendor) AND (Rec."Bal. Account No." <> '') then begin
                Vend.Get(Rec."Bal. Account No.");
                Vend.TestField("Global Dimension 1 Code");
                CheckBatchDivisionDimension(GenJrnalBatch."Division Code", Vend."Global Dimension 1 Code");
            end;
            if (Rec."Bal. Account Type" = Rec."Bal. Account Type"::"Bank Account") AND (Rec."Bal. Account No." <> '') then begin
                BankAcc.Get(Rec."Bal. Account No.");
                //BankAcc.TestField("Global Dimension 1 Code");
                CheckBankBatchDivDimension(GenJrnalBatch, BankAcc."Global Dimension 1 Code", Rec."Bal. Account No.");//DS 27/10/2021
                                                                                                                     //CheckBankBatchDivisionDimension(GenJrnalBatch."Division Code", BankAcc."Global Dimension 1 Code", Rec."Bal. Account No.");
                                                                                                                     //CheckBatchDivisionDimension(GenJrnalBatch."Division Code", BankAcc."Global Dimension 1 Code");
            end;
            if (Rec."Bal. Account Type" = Rec."Bal. Account Type"::"G/L Account") AND (Rec."Bal. Account No." <> '') then begin
                GLAcc.Get(Rec."Bal. Account No.");
                //GLAcc.TestField("Global Dimension 1 Code");//DS 26/10/2021
                //CheckBatchDivisionDimension(GenJrnalBatch."Division Code", GLAcc."Global Dimension 1 Code");//DS 26/10/2021
                CheckGLBatchDivDimension(GenJrnalBatch, GLAcc."Global Dimension 1 Code", Rec."Bal. Account No.");//DS 27/10/2021
            end;
        end;
    End;

    [EventSubscriber(ObjectType::Table, 232, 'OnAfterValidateEvent', 'Bal. Account No.', True, true)]
    local procedure OnAfterValidateEventBatchBalAcc(var Rec: Record "Gen. Journal Batch"; var xRec: Record "Gen. Journal Batch"; CurrFieldNo: Integer)
    var
        Cust: Record Customer;
        Vend: Record Vendor;
        BankAcc: Record "Bank Account";
        GLAcc: Record "G/L Account";
        CompInfo: Record "Company Information";
    Begin
        CompInfo.Get;
        if Not CompInfo."Check Division Consistent" then
            exit;
        if Rec."Skip Division Check" then
            exit;
        if (Rec."Division Code" = '') then
            Error('Please enter Division Code on Journal Batch Name - %1', Rec.Name);

        if (Rec."Bal. Account Type" = Rec."Bal. Account Type"::Customer) AND (Rec."Bal. Account No." <> '') then begin
            Cust.Get(Rec."Bal. Account No.");
            Cust.TestField("Global Dimension 1 Code");
            CheckBatchDivisionDimension(Rec."Division Code", Cust."Global Dimension 1 Code");
        end;
        if (Rec."Bal. Account Type" = Rec."Bal. Account Type"::Vendor) AND (Rec."Bal. Account No." <> '') then begin
            Vend.Get(Rec."Bal. Account No.");
            Vend.TestField("Global Dimension 1 Code");
            CheckBatchDivisionDimension(Rec."Division Code", Vend."Global Dimension 1 Code");
        end;
        if (Rec."Bal. Account Type" = Rec."Bal. Account Type"::"Bank Account") AND (Rec."Bal. Account No." <> '') then begin
            BankAcc.Get(Rec."Bal. Account No.");
            //BankAcc.TestField("Global Dimension 1 Code");
            CheckBankBatchDivisionDimension(Rec."Division Code", BankAcc."Global Dimension 1 Code", Rec."Bal. Account No.");
        end;
        if (Rec."Bal. Account Type" = Rec."Bal. Account Type"::"G/L Account") AND (Rec."Bal. Account No." <> '') then begin
            GLAcc.Get(Rec."Bal. Account No.");
            //GLAcc.TestField("Global Dimension 1 Code");//DS 26/10/2021
            //CheckBankBatchDivisionDimension(Rec."Division Code", GLAcc."Global Dimension 1 Code", Rec."Bal. Account No.");//DS 26/10/2021
            CheckBatchDivisionDimension(Rec."Division Code", GLAcc."Global Dimension 1 Code");//DS 27/10/2021
        end;
    End;

    local procedure CheckBankBatchDivisionDimension(BatchDiv: Code[20]; GenLineDiv: Code[20]; BankCode: Code[20])
    Var
        GlSetup: Record "General Ledger Setup";
        DefDimBank: Record "Default Dimension";
        IsBankDimOK: Boolean;
        ValFilter: Text;
        DimValue: Record "Dimension Value";
    begin


        GlSetup.get;
        If Not DefDimBank.get(270, BankCode, GlSetup."Global Dimension 1 Code") then
            Error('Defualt Dimesnion for Bank Does not Exist');

        Clear(IsBankDimOK);
        if DefDimBank."Allowed Values Filter" <> '' then begin
            ValFilter := DefDimBank."Allowed Values Filter";
            DimValue.SetRange("Dimension Code", DefDimBank."Dimension Code");
            DimValue.SetFilter(Code, ValFilter);
            if DimValue.FindSet() then
                repeat
                    if BatchDiv = DimValue.Code then
                        IsBankDimOK := true;
                until (DimValue.Next() = 0) OR (IsBankDimOK);
            if Not IsBankDimOK then
                Error('Bank Account Dimension %1 is not within range of allowed Dimensions', BatchDiv);
        End Else
            if DefDimBank."Dimension Value Code" <> BatchDiv then
                Error('Bank Dimesnion %1 is not matching with General Line Dimension %2', DefDimBank."Dimension Value Code", BatchDiv);
    end;

    local procedure CheckBatchDivisionDimension(BatchDiv: Code[20]; GenLineDiv: Code[20])
    begin
        If BatchDiv <> GenLineDiv then
            Error('Division Code on Journal Batch %1 is not matching with Division Code on Journal Line %2', BatchDiv, GenLineDiv);
    end;

    //DS 26/10/2021
    local procedure CheckGLBatchDivisionDimension(BatchDiv: Code[20]; GenLineDiv: Code[20]; BankCode: Code[20])
    Var
        GlSetup: Record "General Ledger Setup";
        DefDimBank: Record "Default Dimension";
        IsBankDimOK: Boolean;
        ValFilter: Text;
        DimValue: Record "Dimension Value";
    begin
        GlSetup.get;
        If Not DefDimBank.get(15, BankCode, GlSetup."Global Dimension 1 Code") then
            Error('Defualt Dimesnion for GL Does not Exist');

        Clear(IsBankDimOK);
        if DefDimBank."Allowed Values Filter" <> '' then begin
            ValFilter := DefDimBank."Allowed Values Filter";
            DimValue.SetRange("Dimension Code", DefDimBank."Dimension Code");
            DimValue.SetFilter(Code, ValFilter);
            if DimValue.FindSet() then
                repeat
                    if BatchDiv = DimValue.Code then
                        IsBankDimOK := true;
                until (DimValue.Next() = 0) OR (IsBankDimOK);
            if Not IsBankDimOK then
                Error('GL Account Dimension %1 is not within range of allowed Dimensions', BatchDiv);
        End Else
            if DefDimBank."Dimension Value Code" <> BatchDiv then
                Error('GL Dimesnion %1 is not matching with General Line Dimension %2', DefDimBank."Dimension Value Code", BatchDiv);
    end;

    //DS 26/10/2021
    //DS 27/10/2021 for GL
    local procedure CheckGLBatchDivDimension(Rec: Record "Gen. Journal Batch"; GenLineDiv: Code[20]; BankCode: Code[20])
    Var
        GlSetup: Record "General Ledger Setup";
        DefDimBank: Record "Default Dimension";
        IsBankDimOK: Boolean;
        ValFilter: Text;
        DimValue: Record "Dimension Value";
        DimValueCode: Text;
        GenJournalBatch: Record "Gen. Journal Batch";
    begin
        GenJournalBatch.Copy(Rec);
        GlSetup.get;
        If Not DefDimBank.get(15, BankCode, GlSetup."Global Dimension 1 Code") then
            Error('Defualt Dimesnion for GL Does not Exist');

        Clear(IsBankDimOK);
        if DefDimBank."Allowed Values Filter" <> '' then begin
            ValFilter := DefDimBank."Allowed Values Filter";
            DimValue.SetRange("Dimension Code", DefDimBank."Dimension Code");
            DimValue.SetFilter(Code, ValFilter);
            if DimValue.FindSet() then
                repeat
                    if GenJournalBatch."Division Code" = DimValue.Code then
                        IsBankDimOK := true;
                until (DimValue.Next() = 0) OR (IsBankDimOK);
            if Not IsBankDimOK then
                Error('GL Account Dimension %1 is not within range of allowed Dimensions', GenJournalBatch."Division Code");
        End Else begin
            CheckGLDivisionAccountDimension(GenJournalBatch, GenLineDiv, BankCode, DefDimBank."Dimension Value Code");

        end;
    end;

    local procedure CheckGLDivisionAccountDimension(GenJournalBatch: Record "Gen. Journal Batch"; GenLineDiv: Code[20]; BankCode: Code[20]; DimensionValueCode: Code[20])
    Var
        GlSetup: Record "General Ledger Setup";
        DefDimBank: Record "Default Dimension";
        IsBankDimOK: Boolean;
        ValFilter: Text;
        DimValue: Record "Dimension Value";
        XDimensionValue: Code[20];
        XDimenSionCode: array[50] of text;
        DimensionCode_L: Text;
        i: Integer;
        j: Integer;
    begin
        GlSetup.get;
        i := 0;
        if DimensionValueCode = '' then begin
            Clear(XDimensionValue);
            DefDimBank.Reset();
            DefDimBank.SetRange("Table ID", 15);
            DefDimBank.SetRange("Dimension Code", GlSetup."Global Dimension 1 Code");
            DefDimBank.SetFilter("Dimension Value Code", '<>%1', '');
            DefDimBank.SetCurrentKey("Dimension Value Code");
            if DefDimBank.FindSet() then begin
                repeat
                    if XDimensionValue <> DefDimBank."Dimension Value Code" then begin
                        i += 1;
                        XDimenSionCode[i] := DefDimBank."Dimension Value Code";
                        XDimensionValue := DefDimBank."Dimension Value Code";
                    end;
                until DefDimBank.Next() = 0;
            end;
        end else
            XDimenSionCode[1] := DimensionValueCode;

        if not CheckGLDimensionValueCOde(XDimenSionCode, GenJournalBatch) then
            Error('GL Dimesnion %1 is not matching with General Line Dimension %2', DefDimBank."Dimension Value Code", GenJournalBatch."Division Code");

    end;

    Local procedure CheckGLDimensionValueCOde(DimensionValueCode: array[50] of Text; GenJournalBatch: Record "Gen. Journal Batch"): Boolean
    var
        i: Integer;
        Flag: Boolean;
    begin
        //i := 0;
        for i := 1 to 50 do begin
            if DimensionValueCode[i] <> '' then begin
                GenJournalBatch.setrange("Division Code", DimensionValueCode[i]);
                if GenJournalBatch.FindFirst() then
                    Flag := true;
            end;
        end;
        if Flag then
            exit(true)
        else
            exit(false)
    End;

    //DS 27/10/2021

    //DS 27/10/2021 for Bank
    local procedure CheckBankBatchDivDimension(Rec: Record "Gen. Journal Batch"; GenLineDiv: Code[20]; BankCode: Code[20])
    Var
        GlSetup: Record "General Ledger Setup";
        DefDimBank: Record "Default Dimension";
        IsBankDimOK: Boolean;
        ValFilter: Text;
        DimValue: Record "Dimension Value";
        DimValueCode: Text;
        GenJournalBatch: Record "Gen. Journal Batch";
    begin
        GenJournalBatch.Copy(Rec);
        GlSetup.get;
        If Not DefDimBank.get(270, BankCode, GlSetup."Global Dimension 1 Code") then
            Error('Defualt Dimesnion for Bank Does not Exist');

        Clear(IsBankDimOK);
        if DefDimBank."Allowed Values Filter" <> '' then begin
            ValFilter := DefDimBank."Allowed Values Filter";
            DimValue.SetRange("Dimension Code", DefDimBank."Dimension Code");
            DimValue.SetFilter(Code, ValFilter);
            if DimValue.FindSet() then
                repeat
                    if GenJournalBatch."Division Code" = DimValue.Code then
                        IsBankDimOK := true;
                until (DimValue.Next() = 0) OR (IsBankDimOK);
            if Not IsBankDimOK then
                Error('Bank Account Dimension %1 is not within range of allowed Dimensions', GenJournalBatch."Division Code");
        End Else begin
            CheckBankDivisionAccountDimension(GenJournalBatch, GenLineDiv, BankCode, DefDimBank."Dimension Value Code");

        end;
    end;

    local procedure CheckBankDivisionAccountDimension(GenJournalBatch: Record "Gen. Journal Batch"; GenLineDiv: Code[20]; BankCode: Code[20]; DimensionValueCode: Code[20])
    Var
        GlSetup: Record "General Ledger Setup";
        DefDimBank: Record "Default Dimension";
        IsBankDimOK: Boolean;
        ValFilter: Text;
        DimValue: Record "Dimension Value";
        XDimensionValue: Code[20];
        XDimenSionCode: array[50] of text;
        DimensionCode_L: Text;
        i: Integer;
        j: Integer;
    begin
        GlSetup.get;
        i := 0;
        if DimensionValueCode = '' then begin
            Clear(XDimensionValue);
            DefDimBank.Reset();
            DefDimBank.SetRange("Table ID", 270);
            DefDimBank.SetRange("Dimension Code", GlSetup."Global Dimension 1 Code");
            DefDimBank.SetFilter("Dimension Value Code", '<>%1', '');
            DefDimBank.SetCurrentKey("Dimension Value Code");
            if DefDimBank.FindSet() then begin
                repeat
                    if XDimensionValue <> DefDimBank."Dimension Value Code" then begin
                        i += 1;
                        XDimenSionCode[i] := DefDimBank."Dimension Value Code";
                        XDimensionValue := DefDimBank."Dimension Value Code";
                    end;
                until DefDimBank.Next() = 0;
            end;
        end else
            XDimenSionCode[1] := DimensionValueCode;

        if not CheckGlDimensionValueCOde(XDimenSionCode, GenJournalBatch) then
            Error('Bank Dimesnion %1 is not matching with General Line Dimension %2', DefDimBank."Dimension Value Code", GenJournalBatch."Division Code");

    end;

    [EventSubscriber(ObjectType::Codeunit, 5056, 'OnInsertNewContactOnBeforeAssignNo', '', false, false)]

    local procedure OnInsertNewContactOnBeforeAssignNo(var Contact: Record Contact; var IsHandled: Boolean; Customer: Record Customer);
    var
        ContactRec: Record Contact;
    begin
        if Customer."No." = '' then
            exit;
        ContactRec.Reset();
        ContactRec.SetRange("Company No.", Customer."No.");
        if not ContactRec.FindFirst() then begin
            Contact."No." := Customer."No.";
            IsHandled := true;
        end;

    end;

    [EventSubscriber(ObjectType::Table, 43001027, 'OnAfterValidateEvent', 'No', false, false)]
    local procedure OnAfterValidateNoEvent(var Rec: Record "SDY CSM Case Contact")
    begin
        case Rec.Role of
            Rec.Role::Reporter:
                Message('To add Comments, click Process then Show Comment Sheet.');
        end;
    end;

    var
        myInt: Integer;
}