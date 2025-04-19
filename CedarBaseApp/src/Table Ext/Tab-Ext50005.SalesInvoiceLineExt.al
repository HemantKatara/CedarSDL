tableextension 50005 "Sales Invoice Line Ext" extends "Sales Invoice Line"
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
