page 50001 "Object Header List"
{
    AdditionalSearchTerms = 'Copy Company Data';
    ApplicationArea = All;
    Caption = 'Company Data Transfer List';
    PageType = List;
    SourceTable = "Object Header";
    UsageCategory = Tasks;
    CardPageId = "Object Header Card";
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Company Name"; Rec."Company Name")
                {
                    ToolTip = 'Specifies the value of the Company Name field';
                    ApplicationArea = All;
                }
                field("Dimension Filter"; Rec."Dimension Filter")
                {
                    ToolTip = 'Specifies the value of the Dimension Filter field';
                    ApplicationArea = All;
                }
                field("Last Table No. Processed"; Rec."Last Table No. Processed")
                {
                    ToolTip = 'Specifies the value of the Dimension Filter field';
                    ApplicationArea = All;
                }

                field("Last Run Date Time"; Rec."Last Run Date Time")
                {
                    ToolTip = 'Specifies the value of the Last Run Date field';
                    ApplicationArea = All;
                }
                field("No. of Tables"; Rec."No. of Tables")
                {
                    ApplicationArea = All;
                }
                field("No. of Tables Synced"; Rec."No. of Tables Synced")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
