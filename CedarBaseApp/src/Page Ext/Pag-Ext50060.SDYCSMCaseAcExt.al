pageextension 50060 "SDY CSM Case Action LP Ext" extends "SDY CSM Case Action LP"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        modify(CustomerComment)
        {
            Visible = false;
        }
    }

    var
        myInt: Integer;
}