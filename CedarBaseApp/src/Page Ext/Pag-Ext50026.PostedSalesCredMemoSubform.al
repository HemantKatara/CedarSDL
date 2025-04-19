pageextension 50026 "PostedSalesCredMemoSubform" extends "Posted Sales Cr. Memo Subform"
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
                AutoFormatExpression = SalesCrMemoHeader."Currency Code";
                AutoFormatType = 1;
                CaptionClass = DocumentTotals.GetTotalExclVATCaption(SalesCrMemoHeader."Currency Code");
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
        CustCarriagePer := 0;
        CustCarriageAmt := 0;
        if Cust.get(Rec."Sell-to Customer No.") then
            CustCarriagePer := Cust."Carriage %";
        SalesSetup.Get();
        SalesCrMemoLine.Reset();
        SalesCrMemoLine.SetRange("Document No.", Rec."Document No.");
        SalesCrMemoLine.SetRange(type, SalesCrMemoLine.Type::"G/L Account");
        SalesCrMemoLine.SetRange("No.", SalesSetup."Carriage Account");
        if SalesCrMemoLine.Findfirst then begin
            CustCarriageAmt := SalesCrMemoLine."Line Amount";
        end;
        IF SalesCrMemoHeader.GET(Rec."Document No.") THEN BEGIN
            SalesCrMemoHeader.CALCFIELDS(Amount, "Amount Including VAT", "Invoice Discount Amount");
            TotalExclVAT := SalesCrMemoHeader.Amount - CustCarriageAmt;
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
        SalesCrMemoLine: Record "Sales Cr.Memo Line";
        TotalExclVAT: Decimal;
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        DocumentTotals: Codeunit "Document Totals";
        UserSetup: Record "User Setup";

}
