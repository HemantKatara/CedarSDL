table 57100 "G/L Entry Staging"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = SystemMetadata;
            Caption = 'Entry No.';

        }
        field(2; "Posting Date"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Posting Date';

        }
        field(3; "Document Type"; Enum "Gen. Journal Document Type")
        {
            Caption = 'Document Type';
            DataClassification = SystemMetadata;
        }
        field(4; "Document No."; Code[20])
        {
            DataClassification = SystemMetadata;
            Caption = 'Document No.';

        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';

        }
        field(6; "G/L Entries Tag"; Text[30])
        {
            Caption = 'G/L Entries Tag';

        }
        field(7; "Error Message"; Text[2048])
        {
            Caption = 'Error Message';

        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}