page 50005 "Comment Sheet Subpage"
{

    AutoSplitKey = true;
    Caption = 'Comment Sheet';
    DataCaptionFields = "No.";
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Comment Line";
    SourceTableView = sorting("Created DateTime") order(descending);
    ContextSensitiveHelpPage = 'ui-work-product';





    layout
    {
        area(content)
        {
            repeater(Control1)
            {

                ShowCaption = false;
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Comments;
                    ToolTip = 'Specifies the date the comment was created.';
                }
                field("Comment Type"; Rec."Comment Type")
                {
                    ApplicationArea = Comments;
                    ToolTip = 'Specifies the comment type.';
                }

                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Comments;
                    ToolTip = 'Specifies the comment itself.';
                    Visible = false;
                }
                field("Comment 2"; Rec."Comment 2")
                {
                    ApplicationArea = Comments;
                    ToolTip = 'Specifies the comment itself.';
                    MultiLine = true;
                    Width = 500;
                    Visible = false;


                }
                field(CommentTxt; CommentTxt)
                {
                    Caption = 'Comment';
                    ApplicationArea = Comments;
                    ToolTip = 'Specifies the comment itself.';
                    MultiLine = true;
                    Width = 100;

                    trigger OnValidate()
                    begin
                        Rec.TexttoBlob(CommentTxt);

                    end;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Comments;
                    ToolTip = 'Specifies a code for the comment.';
                    Visible = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = all;
                }
                field("Modified By"; Rec."Modified By")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(PrintComments)
            {
                Caption = 'Print';
                action(PrintComment)
                {
                    ApplicationArea = all;
                    Image = PrintReport;
                    Caption = 'Print Comment';
                    trigger OnAction()
                    var
                        cust: Record Customer;
                    begin
                        cust.Reset();
                        cust.SetRange("No.", rec."No.");
                        if cust.FindFirst() then
                            Report.RunModal(Report::"Comment Sheet Report", true, false, cust);
                    end;


                }
            }
            group("SD Cases")
            {
                action("SD Case Manager")
                {
                    ApplicationArea = all;
                    Caption = 'SD Case Manager';

                    trigger OnAction()
                    var
                        SDYCSMCase: Record "SDY CSM Case";
                    begin
                        case Rec."Table Name" of
                            "Comment Line Table Name"::Customer:
                                begin
                                    SDYCSMCase.Reset();
                                    SDYCSMCase.SetCurrentKey(ReporterCompanyNo);
                                    SDYCSMCase.SetRange(ReporterCompanyNo, Rec."No.");
                                    Page.RunModal(Page::"SDY CSM Case List", SDYCSMCase);
                                end;
                        end;
                    end;
                }

            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.SetUpNewLine;
        Clear(CommentTxt);
    end;

    trigger OnAfterGetRecord()
    begin
        CommentTxt := Rec.BlobtoText();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    Var
        SDYCSMCase: Record "SDY CSM Case";
    begin
        if (Rec."Table Name" = Rec."Table Name"::Customer) AND
        (Rec."Comment Type" = Rec."Comment Type"::"Salesperson Notes") then
            IF CONFIRM('Please change the callback date', TRUE) THEN begin
                SDYCSMCase.Reset();
                SDYCSMCase.SetRange(ReporterCompanyNo, Rec."No.");
                Page.RunModal(Page::"SDY CSM Case List", SDYCSMCase);
            end;
    end;

    var
        CommentTxt: Text;



}