table 50001 "Object Line Details"
{
    Caption = 'Object Line Details';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Company Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Table No."; Integer)
        {
            Caption = 'Table No.';
            DataClassification = ToBeClassified;
            TableRelation = AllObj."Object ID" where("Object Type" = filter('Table'));
            trigger OnValidate()
            var
                TableInformation: Record AllObj;
            begin
                TableInformation.Reset();
                TableInformation.SetRange("Object Type", TableInformation."Object Type"::Table);
                TableInformation.SetRange("Object ID", "Table No.");
                if TableInformation.FindFirst() then
                    "Table Name" := TableInformation."Object Name";
            end;
        }
        field(3; "Table Name"; Text[30])
        {
            Caption = 'Table Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Last Entry No."; Integer)
        {
            Caption = 'Last Entry No.';
            Editable = false;
            DataClassification = ToBeClassified;
        }

        field(6; "Last Run Date Time"; DateTime)
        {
            Caption = 'Last Run Date Time';
            Editable = false;
            DataClassification = ToBeClassified;
        }


        field(7; "Skip Processing"; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                "Process Table" := false;
            end;
        }
        field(8; "Process Table"; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                "Skip Processing" := false;
            end;
        }
        field(9; "Last Error"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Sync; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Last Record ID"; RecordId)
        {
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; "Company Name", "Table No.")
        {
            Clustered = true;
        }
    }

}
