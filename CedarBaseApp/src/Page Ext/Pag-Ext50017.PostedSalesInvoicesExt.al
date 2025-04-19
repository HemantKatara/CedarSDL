pageextension 50017 "Posted Sales Invoices Ext" extends "Posted Sales Invoices"
{
    ContextSensitiveHelpPage = 'sales-how-invoice-sales';
    layout
    {
        // Add changes to page layout here
        modify("Order No.")
        {
            Visible = true;
        }
        modify("Posting Date")
        {
            Visible = true;
        }

    }

}