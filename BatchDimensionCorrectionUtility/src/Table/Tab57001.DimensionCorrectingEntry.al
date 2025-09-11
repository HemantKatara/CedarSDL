table 57001 "Custom Dims Correction Entry"
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
            DataClassification = SystemMetadata;
            Caption = 'Description';

        }
        field(6; "Dimension Code"; Code[20])
        {
            DataClassification = SystemMetadata;
            Caption = 'Dimension Code';
        }
        field(7; "Dimension Value Code"; Text[100])
        {
            DataClassification = SystemMetadata;
            Caption = 'Dimension Value Code';
        }

        field(8; "New Dimension Value Code"; Text[100])
        {
            DataClassification = SystemMetadata;
            Caption = 'New Dimension Value Code';
        }
        field(9; "Error Message"; Text[2048])
        {
            Caption = 'Error Message';
            DataClassification = SystemMetadata;
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