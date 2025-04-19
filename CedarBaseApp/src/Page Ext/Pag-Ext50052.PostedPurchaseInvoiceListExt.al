pageextension 50052 "PostedPurchaseInvoiceListExt" extends "Posted Purchase Invoices"
{

    layout
    {
        addafter("Buy-from Vendor No.")
        {
            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = all;
            }

        }
        modify("Buy-from Post Code")
        {
            Visible = true;
        }
    }

}
