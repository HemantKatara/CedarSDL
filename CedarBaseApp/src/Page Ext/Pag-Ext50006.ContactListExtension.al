pageextension 50006 "Contact List Extension" extends "Contact List"
{
    ContextSensitiveHelpPage = 'marketing-contacts';
    layout
    {
        // Add changes to page layout here
        modify("Post Code")
        {
            Visible = true;
        }
        addafter("Salesperson Code")
        {
            field(Blocked; Rec.Blocked)
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}