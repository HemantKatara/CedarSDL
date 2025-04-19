tableextension 50013 "Gen. Journal Batch Ext" extends "Gen. Journal Batch"
{
    fields
    {
        field(50000; "Division Code"; Code[20])
        {
            Caption = 'Division Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            DataClassification = ToBeClassified;
        }


        field(50001; "Skip Division Check"; Boolean)
        {
            Caption = 'Skip Division Check';
            DataClassification = ToBeClassified;
        }
    }
}
