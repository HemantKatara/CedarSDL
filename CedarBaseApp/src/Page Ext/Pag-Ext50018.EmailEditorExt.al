pageextension 50018 "EmailEditorExt" extends "Email Accounts"
{
    layout
    {
        // Add changes to page layout here
        // modify(Account)
        // {
        //     Visible = false;
        // }
        // addafter(Account)
        // {
        //     field(FromEmail; FromEmail)
        //     {
        //         Caption = 'From';
        //         ApplicationArea = all;
        //         Editable = false;
        //     }
        // }

    }


    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
        FromEmail: Text;
        UserSEtup: Record "User Setup";
        Filter1: Text[30];
        Filter2: Text[30];
        Filter3: Text[30];
        EmailFilter: Text[50];

    trigger OnOpenPage()
    begin
        if UserSEtup.get(UserId) and (UserSEtup."Filter Email") then begin

            if UserSEtup."Email Filter Text1" <> '' then
                Filter1 := '*' + UserSEtup."Email Filter Text1" + '*';
            if UserSEtup."Email Filter Text2" <> '' then
                Filter2 := '*' + UserSEtup."Email Filter Text2" + '*';
            rec.SetFilter("Email Address", '%1|%2', Filter1, Filter2);
        end;
    end;
}