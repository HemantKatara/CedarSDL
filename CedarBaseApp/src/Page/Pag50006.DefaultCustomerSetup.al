page 50006 "Default Customer Setup"
{
    ApplicationArea = All;
    Caption = 'Default Customer Setup';
    PageType = List;
    SourceTable = "Default Customer Setup";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Division Code"; Rec."Division Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Division Code field.';
                }
                field("Default Gen. Bus. Posting Group"; Rec."Def. Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
                }
                field("Default VAT Bus. Posting Group"; Rec."Default VAT Bus. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Bus. Posting Group field.';
                }
                field("Default Reminder Terms Code"; Rec."Default Reminder Terms Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reminder Terms Code field.';
                }
                field("Default Dimension Code"; Rec."Default Dimension Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dimension Code field.';
                }
                field("Default Dimension Value Code"; Rec."Default Dimension Value Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dimension Value Code field.';
                }
                field("Default Allowed Values Filter"; Rec."Default Allowed Values Filter")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Allowed Values Filter field.';
                }
            }
        }
    }
}
