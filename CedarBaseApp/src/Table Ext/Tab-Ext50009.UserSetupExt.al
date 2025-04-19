tableextension 50009 "User Setup Ext" extends "User Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Division Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Division.code;
        }
        field(50001; "Filter Email"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Allow Contact Modify"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Hide Document Carriage Line"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Email Filter Text1"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Email Filter Text2"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Allow Cancel BSO"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Allow View All BSO"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Sales Orders list"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}