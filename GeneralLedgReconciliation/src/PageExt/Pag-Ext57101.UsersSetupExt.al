pageextension 57101 "Users Setup Ext" extends "User Setup"
{
    layout
    {
        addafter("Register Time")
        {
            field("Allow Modify GL"; Rec."Allow G/L Tag")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies if the user is allowed to modify G/L Tag.';
                Caption = 'Allow G/L Tag';

            }
        }
    }
}