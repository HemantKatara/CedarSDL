pageextension 50051 "VatEntriesExt" extends "VAT Entries"
{
    ContextSensitiveHelpPage = 'finance-work-with-vat';
    layout
    {
        addafter("VAT Bus. Posting Group")
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = all;
            }
        }
    }

}
