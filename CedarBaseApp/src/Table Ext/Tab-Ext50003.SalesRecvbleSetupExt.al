tableextension 50003 "SalesRecvbleSetupExt" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50000; "Carriage Account"; Code[20])
        {
            Caption = 'Carriage Account';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No." where("Direct Posting" = const(true));
        }
        field(50001; "Check Def. Dimension on Order"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

    }
}
