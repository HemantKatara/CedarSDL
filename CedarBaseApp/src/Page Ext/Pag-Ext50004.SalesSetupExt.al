pageextension 50004 "SalesSetupExt" extends "Sales & Receivables Setup"
{
    ContextSensitiveHelpPage = 'sales-setup-sales';
    layout
    {
        addafter("Ext. Doc. No. Mandatory")
        {
            Field("Carriage Account"; Rec."Carriage Account")
            {
                ApplicationArea = all;
                AboutTitle = '';
                AboutText = '';
                ToolTip = '';


            }
            Field("Check Def. Dimension on Order"; Rec."Check Def. Dimension on Order")
            {
                ApplicationArea = all;
                Caption = 'Enable Document Dim Check';
                AboutTitle = '';
                AboutText = '';
                ToolTip = '';

            }
        }
    }

}
