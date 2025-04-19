pageextension 50005 "General Ledger Entries Ext" extends "General Ledger Entries"
{
    ContextSensitiveHelpPage = 'finance-general-ledger';
    layout
    {
        // Add changes to page layout here
        modify("Global Dimension 1 Code")
        {
            Visible = true;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}