tableextension 50008 "No. Series Line Ext" extends "No. Series Line"
{
    fields
    {
        // Add changes to table fields here
        field(50001; "Division Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Division.Code;
        }
    }

    var
        myInt: Integer;
}