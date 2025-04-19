pageextension 50027 "SalesOrderListExt" extends "Sales Order List"
{

    ContextSensitiveHelpPage = 'sales-how-sell-products';
    layout
    {
        // added by smdx-hitesh
        addafter(Status)
        {
            field("Customer Blocked status"; REC."Customer Blocked status")
            {
                ApplicationArea = all;
            }
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

    }

    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        if UserSetup.Get(UserId) then
            If UserSetup."Sales Orders list" then
                Rec.SetFilter("Package Tracking No.", '<>CANCEL*&<>ERROR');
    end;

}
