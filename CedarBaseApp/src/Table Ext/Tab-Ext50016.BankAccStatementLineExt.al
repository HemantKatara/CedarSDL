tableextension 50016 "Bank Acc. Statement Line Ext." extends "Bank Account Statement Line"
{
    fields
    {
        field(50000; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Division Code';
            FieldClass = FlowField;
            CalcFormula = lookup("Bank Account"."Global Dimension 1 Code" Where("No." = field("Bank Account No.")));
        }
    }

    var
        myInt: Integer;
}