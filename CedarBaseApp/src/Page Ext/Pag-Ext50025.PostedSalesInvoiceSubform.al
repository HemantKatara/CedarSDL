pageextension 50025 "PostedSalesInvoiceSubform" extends "Posted Sales Invoice Subform"
{

    layout
    {
        modify("Total Amount Excl. VAT")
        {
            Visible = false;
        }
        addafter("Invoice Discount Amount")
        {
            field(CustCarriagePer; CustCarriagePer)
            {
                ApplicationArea = all;
                Caption = 'Carriage %';
                Editable = false;
            }
        }
        addafter("Total Amount Excl. VAT")
        {
            field(TotalExclVAT; TotalExclVAT)
            {
                ApplicationArea = all;
                Editable = false;
                AutoFormatExpression = SalesInvoiceHeader."Currency Code";
                AutoFormatType = 1;
                CaptionClass = DocumentTotals.GetTotalExclVATCaption(SalesInvoiceHeader."Currency Code");
                Caption = 'Total Amount Excl. VAT';
                DrillDown = false;
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

    trigger OnAfterGetRecord()
    begin
        IF SalesInvoiceHeader.GET(Rec."Document No.") THEN BEGIN
            CustCarriagePer := 0;
            CustCarriageAmt := 0;
            if Cust.get(Rec."Sell-to Customer No.") then
                CustCarriagePer := Cust."Carriage %";
            SalesSetup.Get();
            SalesInvLine.Reset();
            SalesInvLine.SetRange("Document No.", SalesInvoiceHeader."No.");
            SalesInvLine.SetRange(type, SalesInvLine.Type::"G/L Account");
            SalesInvLine.SetRange("No.", SalesSetup."Carriage Account");
            if SalesInvLine.Findfirst then
                CustCarriageAmt := SalesInvLine."Line Amount"
            else
                CustCarriageAmt := 0;

            SalesInvoiceHeader.CALCFIELDS(Amount, "Amount Including VAT", "Invoice Discount Amount");
            TotalExclVAT := SalesInvoiceHeader.Amount - CustCarriageAmt;
        END;
        UserSetup.Get(UserId);
        IF UserSetup."Hide Document Carriage Line" then
            Rec.SETRANGE("Carriage Line", FALSE);
    end;




    var
        CustCarriagePer: Decimal;
        CustCarriageAmt: Decimal;
        Cust: Record Customer;
        SalesSetup: Record "Sales & Receivables Setup";
        SalesInvLine: Record "Sales Invoice Line";
        TotalExclVAT: Decimal;
        SalesInvoiceHeader: Record "Sales Invoice Header";
        DocumentTotals: Codeunit "Document Totals";
        UserSetup: Record "User Setup";

}
