table 50000 "Object Header"
{
    Caption = 'Object Header';
    DataClassification = ToBeClassified;

    fields
    {

        field(2; "Company Name"; Text[30])
        {
            Caption = 'Company Name';
            DataClassification = ToBeClassified;
            TableRelation = Company;
            trigger OnValidate()
            begin
                if "Company Name" = CompanyName then
                    Error('Company Name cannot be same as Current Company Name');
            end;
        }
        field(3; "Dimension Filter"; Code[20])
        {
            Caption = 'Dimension Filter';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            ValidateTableRelation = FALSE;
        }
        field(4; "Last Run Date Time"; DateTime)
        {
            Caption = 'Last Run Date Time';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Last Table No. Processed"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Process All Tables"; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                ObjectDetails: Record "Object Line Details";
            begin
                ObjectDetails.SetRange("Company Name", "Company Name");
                ObjectDetails.ModifyAll("Process Table", "Process All Tables");
            end;
        }
        field(7; "No. of Tables"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Object Line Details" where("Company Name" = field("Company Name")));
            Editable = false;

        }
        field(8; "No. of Tables Synced"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Object Line Details" where("Company Name" = field("Company Name"), Sync = const(true)));
            Editable = false;
        }

    }

    keys
    {
        key(PK; "Company Name")
        {
            Clustered = true;
        }
    }
    trigger OnDelete()
    var
        ObjectLines: Record "Object Line Details";
    begin
        ObjectLines.SetRange("Company Name", "Company Name");
        ObjectLines.DeleteAll();
    end;

    procedure PopulateTablesinLines()
    var
        TableInfo: Record AllObj;
        ObjectLines: Record "Object Line Details";
    begin
        ObjectLines.SetRange("Company Name", "Company Name");
        ObjectLines.DeleteAll();
        TableInfo.Reset();
        TableInfo.SetRange("Object Type", TableInfo."Object Type"::Table);
        //TableInfo.SetFilter("No. of Records", '>%1', 0);
        TableInfo.SetFilter("Object ID", '<>%1|<>%2', 50000, 50001);
        if TableInfo.FindSet() then
            repeat
                ObjectLines.Init();
                ObjectLines."Company Name" := "Company Name";
                ObjectLines.Validate("Table No.", TableInfo."Object ID");
                ObjectLines.Validate("Process Table", Rec."Process All Tables");
                ObjectLines.Insert();
            Until TableInfo.Next() = 0;
    end;

}
