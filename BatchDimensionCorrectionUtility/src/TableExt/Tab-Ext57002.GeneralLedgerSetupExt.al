tableextension 57002 "GeneralLedgerSetupExt" extends "General Ledger Setup"
{
    fields
    {
        field(57001; "No. of batch correct Dims"; Integer)
        {
            Caption = 'No. of Entries to batch correct Dims';
            DataClassification = ToBeClassified;
        }
        field(57002; "Enable Correction Notification"; Boolean)
        {
            Caption = 'Enable Correction Notification';
            DataClassification = ToBeClassified;
        }
        field(57003; "Correction Notification Email"; Text[250])
        {
            Caption = 'Correction Notification Email';
            DataClassification = ToBeClassified;
        }
    }
}
