tableextension 50012 "Sales Shipment Line Ext" extends "Sales Shipment Line"
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
