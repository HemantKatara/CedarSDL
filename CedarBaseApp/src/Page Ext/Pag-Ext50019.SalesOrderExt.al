pageextension 50019 "Sales Order Ext" extends "Sales Order"
{
    ContextSensitiveHelpPage = 'sales-how-invoice-sales';
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

        modify(PostAndSend)
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
        Error('Create Sales Order Document from Customer');
    end;
}
pageextension 50020 "Sales Invoice Ext" extends "Sales Invoice"
{

    trigger OnInsertRecord(BelowXrec: Boolean): Boolean
    begin
        Error('Create Sales Invoice Document from Customer');
    end;
}
pageextension 50021 "Sales CredMemo Ext" extends "Sales Credit Memo"
{
    trigger OnInsertRecord(BelowXrec: Boolean): Boolean
    begin
        Error('Create Sales CreditMemo Document from Customer');
    end;
}
pageextension 50022 "Sales Quote Ext" extends "Sales Quote"
{
    trigger OnInsertRecord(BelowXrec: Boolean): Boolean
    begin
        Error('Create Sales Quote Document from Customer');
    end;
}
pageextension 50023 "Sales ReturnOrd Ext" extends "Sales Return Order"
{
    trigger OnInsertRecord(BelowXrec: Boolean): Boolean
    begin
        Error('Create Sales Return Order Document from Customer');
    end;
}

