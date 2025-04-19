pageextension 50007 "Sales Order Subform Ext" extends "Sales Order Subform"
{
    ContextSensitiveHelpPage = 'sales-how-sell-products';
    layout
    {
        modify("No.")
        {

            trigger OnLookup(var Text: Text): Boolean
            var
                EventSubscribe: Codeunit "Subscriber Codeunit";
                NewItemCode: Code[20];
                ItemRec: Record Item;
                SalesHeader: Record "Sales Header";
                GLaAcc: Record "G/L Account";
                Resource: Record Resource;
                FA: Record "Fixed Asset";
                ChargeItem: Record "Item Charge";
                Customer: Record Customer;

            begin
                if Rec.type = Rec.type::item then begin
                    SalesHeader.get(Rec."Document Type", Rec."Document No.");
                    Customer.get(SalesHeader."Sell-to Customer No.");
                    Customer.TestField("Global Dimension 1 Code");
                    Clear(EventSubscribe);
                    EventSubscribe.ItemLookUp(Rec."No.", NewItemCode, Customer."Global Dimension 1 Code", True, Customer."No.");
                    if NewItemCode <> '' then begin
                        if Rec."No." <> NewItemCode then begin
                            Rec.Validate("No.", NewItemCode);
                            NoOnAfterValidate();
                            UpdateEditableOnRow();
                            UpdateTypeText();
                            DeltaUpdateTotals();

                        end;
                    end;
                    //CurrPage.Update();
                end;
                if Rec.type = Rec.type::"G/L Account" then begin
                    GLaAcc.Reset();
                    GLaAcc.SetRange("Direct Posting", true);
                    GLaAcc.SetRange(Blocked, false);
                    GLaAcc.SetRange("Account Type", GLaAcc."Account Type"::Posting);
                    if Page.RunModal(Page::"G/L Account List", GLaAcc) = Action::LookupOK then
                        Rec.Validate("No.", GLaAcc."No.");
                end;
                if Rec.type = Rec.type::"Fixed Asset" then begin
                    FA.Reset();
                    if Page.RunModal(Page::"Fixed Asset List", FA) = Action::LookupOK then
                        Rec.Validate("No.", FA."No.");
                end;
                if Rec.type = Rec.type::Resource then begin
                    FA.Reset();
                    if Page.RunModal(Page::"Resource List", Resource) = Action::LookupOK then
                        Rec.Validate("No.", Resource."No.");
                end;
                if Rec.type = Rec.type::"Charge (Item)" then begin
                    FA.Reset();
                    if Page.RunModal(Page::"Item Charges", ChargeItem) = Action::LookupOK then
                        Rec.Validate("No.", ChargeItem."No.");
                end;
            end;
        }
        modify(Description)
        {
            trigger OnLookup(var Text: Text): Boolean
            begin
                //stop lookup
            end;
        }
        modify("Total Amount Excl. VAT")
        {
            Visible = false;
        }
        modify("TotalSalesLine.""Line Amount""")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 1 Code")
        {
            Editable = false;
        }
        addafter("Shipment Date")
        {
            field("Invoice Date"; Rec."Invoice Date")
            {
                ApplicationArea = all;
            }
        }
        addafter("Invoice Disc. Pct.")
        {
            field(CustCarriagePer; CustCarriagePer)
            {
                ApplicationArea = all;
                Caption = 'Carriage %';
                Editable = false;
            }
        }
        addbefore("Invoice Discount Amount")
        {
            field(SubtotalExclVAT2; SubtotalExclVAT2)
            {
                ApplicationArea = All;
                AutoFormatExpression = Currency.Code;
                AutoFormatType = 1;
                CaptionClass = DocumentTotals.GetTotalLineAmountWithVATAndCurrencyCaption(Currency.Code, TotalSalesHeader."Prices Including VAT");
                Caption = 'Subtotal Excl. VAT';
                DrillDown = false;
                Editable = false;
                ToolTip = 'Specifies the sum of the value in the Line Amount Excl. VAT field on all lines in the document.';

            }
        }
        addafter("Total Amount Excl. VAT")
        {
            field(TotAmtExclVAT; TotAmtExclVAT)
            {
                ApplicationArea = All;
                AutoFormatExpression = Currency.Code;
                AutoFormatType = 1;
                CaptionClass = DocumentTotals.GetTotalExclVATCaption(Currency.Code);
                Caption = 'Total Amount Excl. VAT';
                DrillDown = false;
                Editable = false;
                ToolTip = 'Specifies the sum of the value in the Line Amount Excl. VAT field on all lines in the document minus any discount amount in the Invoice Discount Amount field.';

            }
            field(CustCarriageAmt; CustCarriageAmt)
            {
                ApplicationArea = all;
                Caption = 'Carriage Cost Amount';
                Editable = false;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CustCarriagePer := 0;
        CustCarriageAmt := 0;
        TotAmtExclVAT := 0;
        SubtotalExclVAT2 := 0;
        if SalesHeader.Get(Rec."Document Type", Rec."Document No.") then;
        if Cust.get(SalesHeader."Sell-to Customer No.") then
            CustCarriagePer := Cust."Carriage %";
        SalesSetup.Get();
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."Document No.");
        SalesLine.SetRange(type, SalesLine.Type::"G/L Account");
        SalesLine.SetRange("No.", SalesSetup."Carriage Account");
        if SalesLine.Findfirst then begin
            CustCarriageAmt := SalesLine."Line Amount";
        end;
        if SalesHeader.Get(Rec."Document Type", Rec."Document No.") then Begin
            SalesHeader.CalcFields(Amount);
            TotAmtExclVAT := SalesHeader.Amount - CustCarriageAmt;
            DocumentTotals.SalesDocTotalsNotUpToDate();
            DocumentTotals.GetTotalSalesHeaderAndCurrency(Rec, TotalSalesHeader, Currency);
            DocumentTotals.SalesCheckIfDocumentChanged(Rec, xRec);
            DocumentTotals.CalculateSalesSubPageTotals(TotalSalesHeader, TotalSalesLine, VATAmount, InvoiceDiscountAmount, InvoiceDiscountPct);
            SubtotalExclVAT2 := TotalSalesLine."Line Amount" - CustCarriageAmt;
            DocumentTotals.RefreshSalesLine(Rec);
        End;
        UserSetup.Get(UserId);
        IF UserSetup."Hide Document Carriage Line" then
            Rec.SETRANGE("Carriage Line", FALSE);

    end;

    trigger OnAfterGetRecord()
    begin
        UserSetup.Get(UserId);
        IF UserSetup."Hide Document Carriage Line" then
            Rec.SETRANGE("Carriage Line", FALSE);

    end;




    var
        CustCarriagePer: Decimal;
        CustCarriageAmt: Decimal;
        Cust: Record Customer;
        SalesSetup: Record "Sales & Receivables Setup";
        SalesLine: Record "Sales Line";
        SalesHeader: Record "Sales Header";
        Currency: Record Currency;
        TotAmtExclVAT: Decimal;
        DocumentTotals: Codeunit "Document Totals";
        UserSetup: Record "User Setup";
        SubtotalExclVAT2: Decimal;





}