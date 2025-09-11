pageextension 57001 "UsersSetupExt" extends "User Setup"
{
    layout
    {
        addafter("Register Time")
        {
            field("Allow Batch Dim Correction"; Rec."Allow Batch Dim Correction")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow Batch Dim Correction field.', Comment = '%';
            }

        }
    }

}