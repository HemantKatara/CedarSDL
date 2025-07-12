pageextension 57100 "General Ledger Setup Ext" extends "General Ledger Setup"
{
    layout
    {
        addlast(General)
        {
            field("No. of G/L Tag Records"; Rec."No. of G/L Tag Records")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the number of records to be processed in each call.';
                Caption = 'No. of G/L Tag Records';
            }
        }
    }
}
