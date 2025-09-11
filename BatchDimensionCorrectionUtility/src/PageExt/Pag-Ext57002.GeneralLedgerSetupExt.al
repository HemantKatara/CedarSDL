pageextension 57002 "GeneralLedgerSetupExt" extends "General Ledger Setup"
{
    layout
    {
        addlast(General)
        {
            field("No. of batch correct Dims"; Rec."No. of batch correct Dims")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the No. of Entries to batch correct Dims field.', Comment = '%';
            }
            field("Enable Correction Notification"; Rec."Enable Correction Notification")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Enable Correction Notification field.', Comment = '%';
            }
            field("Correction Notification Email"; Rec."Correction Notification Email")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Correction Notification Email field.', Comment = '%';
            }
        }
    }


}
