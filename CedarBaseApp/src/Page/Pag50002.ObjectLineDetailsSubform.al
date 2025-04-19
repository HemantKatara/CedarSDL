page 50002 "Object Line Details Subform"
{

    Caption = 'Company Data Transfer Subform';
    PageType = ListPart;
    SourceTable = "Object Line Details";
    DelayedInsert = true;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Table No."; Rec."Table No.")
                {
                    ToolTip = 'Specifies the value of the Table No. field';
                    ApplicationArea = All;
                }
                field("Table Name"; Rec."Table Name")
                {
                    ToolTip = 'Specifies the value of the Table Name field';
                    ApplicationArea = All;
                }

                field("Process Table"; Rec."Process Table")
                {
                    ApplicationArea = All;
                }
                field("Skip Processing"; Rec."Skip Processing")
                {
                    ApplicationArea = All;
                }
                field(Sync; Rec.Sync)
                {
                    ApplicationArea = all;
                }

                field("Last Entry No."; Rec."Last Entry No.")
                {
                    ToolTip = 'Specifies the value of the Last Entry No. field';
                    ApplicationArea = All;
                }
                field(LastRecordid; LastRecordid)
                {
                    ApplicationArea = all;
                    Caption = 'Last Record ID';
                }
                field("Last Run Date Time"; Rec."Last Run Date Time")
                {
                    ToolTip = 'Specifies the value of the Last Run Date Time field';
                    ApplicationArea = All;
                }
                field("Last Error"; Rec."Last Error")
                {
                    ApplicationArea = all;
                }
            }

        }

    }
    trigger OnAfterGetRecord()
    begin
        LastRecordid := Format(Rec."Last Record ID", 0, 1);
    end;

    var
        LastRecordid: Text;

}
