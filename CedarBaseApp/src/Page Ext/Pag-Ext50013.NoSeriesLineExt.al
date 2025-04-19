pageextension 50013 "No. Series Line Ext" extends "No. Series Lines"
{
    ContextSensitiveHelpPage = 'ui-create-number-series';
    layout
    {
        // Add changes to page layout here
        addafter("Ending No.")
        {
            field("Division Code"; Rec."Division Code")
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