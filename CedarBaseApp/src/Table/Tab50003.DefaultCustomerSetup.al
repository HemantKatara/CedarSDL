table 50003 "Default Customer Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Division Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Division.Code;
        }
        field(2; "Default Gen. Bus. Posting Group"; Code[20])
        {
            ObsoleteState = Removed;
            ObsoleteReason = 'Field Lenght Issue';
            Caption = 'Default Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(8; "Def. Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Default Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(3; "Default VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'Default VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(4; "Default Reminder Terms Code"; Code[10])
        {
            Caption = 'Default Reminder Terms Code';
            TableRelation = "Reminder Terms";
        }
        field(5; "Default Dimension Code"; Code[20])
        {
            Caption = 'Default Dimension Code';
            NotBlank = true;
            TableRelation = Dimension;
        }
        field(6; "Default Dimension Value Code"; Code[20])
        {
            Caption = 'Default Dimension Value Code';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = FIELD("Default Dimension Code"),
                                                         Blocked = CONST(false));
        }
        field(7; "Default Allowed Values Filter"; Text[250])
        {
            Caption = 'Default Values Filter';
            DataClassification = ToBeClassified;
        }
    }



    keys
    {
        key(Key1; "Division Code")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}