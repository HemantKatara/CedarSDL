pageextension 50014 "User Setup Ext" extends "User Setup"
{
    ContextSensitiveHelpPage = 'ui-how-users-permissions';
    layout
    {
        // Add changes to page layout here
        addafter("Salespers./Purch. Code")
        {
            field("Division Code"; Rec."Division Code")
            {
                ApplicationArea = all;
            }
            field("Filter Email"; Rec."Filter Email")
            {
                ApplicationArea = all;
            }
            field("Email Filter Text1"; Rec."Email Filter Text1")
            {
                ApplicationArea = all;
            }
            field("Email Filter Text2"; Rec."Email Filter Text2")
            {
                ApplicationArea = all;
            }
            field("Allow Contact Modify"; Rec."Allow Contact Modify")
            {
                ApplicationArea = all;
            }
            field("Hide Document Carriage Line"; Rec."Hide Document Carriage Line")
            {
                ApplicationArea = all;
            }
            field("Allow Cancel BSO"; Rec."Allow Cancel BSO")
            {
                ApplicationArea = all;
            }
            field("Allow View All BSO"; Rec."Allow View All BSO")
            {
                ApplicationArea = all;
            }
            field("Sales Orders list"; Rec."Sales Orders list")
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