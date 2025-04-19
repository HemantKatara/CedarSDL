pageextension 50039 "PostedSalesShipmentSubform" extends "Posted Sales Shpt. Subform"
{

    layout
    {


    }

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
        SalesInvLine: Record "Sales Invoice Line";
        TotalExclVAT: Decimal;
        SalesInvoiceHeader: Record "Sales Invoice Header";
        DocumentTotals: Codeunit "Document Totals";
        UserSetup: Record "User Setup";

}
