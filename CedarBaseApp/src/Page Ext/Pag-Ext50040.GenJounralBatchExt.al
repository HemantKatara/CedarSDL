pageextension 50040 "GenJounral Batch Ext" extends "General Journal Batches"
{
    ContextSensitiveHelpPage = 'ui-work-general-journals';
    layout
    {
        addafter("No. Series")
        {
            field("Division Code"; Rec."Division Code")
            {
                ApplicationArea = all;
            }
        }

    }
}