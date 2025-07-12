pageextension 57000 "General Ledger Entries Ext" extends "General Ledger Entries"
{
    layout
    {
        addafter("Bal. Account No.")
        {
            field("G/L Entries Tag"; Rec."G/L Entries Tag")

            {

                ApplicationArea = All;
                ToolTip = 'Specifies the G/L Entries Tag of the entry.';
                Editable = false;
            }
        }
    }


}
