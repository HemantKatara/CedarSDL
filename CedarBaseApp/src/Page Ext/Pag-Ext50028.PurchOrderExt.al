pageextension 50028 "Purch Order Ext" extends "Purchase Order"
{
    trigger OnInsertRecord(BelowXrec: Boolean): Boolean
    begin
        Error('Create Purchase Order Document from Vendor');
    end;
}
pageextension 50029 "Purch Invoice Ext" extends "Purchase Invoice"
{
    layout
    {
        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }
    }
    actions
    {
        modify(Post)
        {
            Visible = false;
        }
        modify(PostAndNew)
        {
            Visible = false;
        }

    }

    trigger OnInsertRecord(BelowXrec: Boolean): Boolean
    begin
        Error('Create Purchase Invoice Document from Vendor');
    end;
}
pageextension 50030 "Purchase CredMemo Ext" extends "Purchase Credit Memo"
{
    trigger OnInsertRecord(BelowXrec: Boolean): Boolean
    begin
        Error('Create Purchase CreditMemo Document from Vendor');
    end;
}
pageextension 50031 "Purchase Return Ext" extends "Purchase Return Order"
{
    trigger OnInsertRecord(BelowXrec: Boolean): Boolean
    begin
        Error('Create Purchase Return Order Document from Vendor');
    end;
}
pageextension 50032 "Purchase Quote Ext" extends "Purchase Quote"
{
    trigger OnInsertRecord(BelowXrec: Boolean): Boolean
    begin
        Error('Create Purchase Quote Document from Vendor');
    end;
}
pageextension 50033 "Purchase BlanketOrder Ext" extends "Blanket Purchase Order"
{
    trigger OnInsertRecord(BelowXrec: Boolean): Boolean
    begin
        Error('Create Purchase Blanket Order Document from Vendor');
    end;
}

