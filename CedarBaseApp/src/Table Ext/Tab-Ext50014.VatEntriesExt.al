tableextension 50014 "Vat Entries Ext" extends "VAT Entry"
{
    fields
    {
        field(50000; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Division Code';
            FieldClass = FlowField;
            CalcFormula = lookup("G/L Entry"."Global Dimension 1 Code" Where("Document No." = field("Document No.")));
        }
    }
}
