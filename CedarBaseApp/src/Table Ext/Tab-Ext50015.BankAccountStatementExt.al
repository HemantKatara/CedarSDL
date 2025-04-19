tableextension 50015 "Bank Account Statement Ext." extends "Bank Account Statement"
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