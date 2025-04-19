tableextension 50007 "SalesCrMemoLineExt" extends "Sales Cr.Memo Line"
{
    fields
    {
        field(50000; "Group"; Integer)
        {
            Caption = 'Group';
            DataClassification = ToBeClassified;
        }

        field(50002; "Carriage Line"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}
