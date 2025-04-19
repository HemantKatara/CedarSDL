pageextension 50041 "PurchaseInvoiceListExt" extends "Purchase Invoices"
{
    ContextSensitiveHelpPage = 'purchasing-how-record-purchases';
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
    actions
    {
        modify(PostAndPrint)
        {
            Visible = false;
        }



    }
}
