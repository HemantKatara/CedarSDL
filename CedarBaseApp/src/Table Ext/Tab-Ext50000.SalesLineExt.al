tableextension 50000 "Sales Line Ext" extends "Sales Line"
{
    fields
    {
        field(50000; "Group"; Integer)
        {
            Caption = 'Group';
            DataClassification = ToBeClassified;
        }
        field(50001; "Invoice Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Carriage Line"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(GroupKey; Group)
        {

        }
    }
}
