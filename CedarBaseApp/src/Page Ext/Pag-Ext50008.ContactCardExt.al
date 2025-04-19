pageextension 50008 "Contact Card Ext" extends "Contact Card"
{
    ContextSensitiveHelpPage = 'marketing-contacts';
    layout
    {
        // Add changes to page layout here
        addlast(General)
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
    trigger OnOpenPage()
    begin
        UserSEtup.get(UserId);
        if UserSEtup."Allow Contact Modify" then
            CurrPage.Editable(true)
        else
            CurrPage.Editable(false)
    end;

    var
        UserSEtup: Record "User Setup";

}