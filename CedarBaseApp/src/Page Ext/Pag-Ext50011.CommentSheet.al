pageextension 50011 "Comment Sheet" extends "Comment Sheet"
{
    ContextSensitiveHelpPage = 'ui-work-product';
    layout
    {
        modify(Date)
        {
            Visible = false;
        }

        // Add changes to page layout here
        addbefore(Comment)
        {
            field("Created DateTime"; Rec."Created DateTime")
            {

                ApplicationArea = all;

            }
            field("Comment Type"; Rec."Comment Type")
            {
                ApplicationArea = Comments;
                ToolTip = 'Specifies the comment type.';
            }

        }
        addafter(Comment)
        {
            field("Comment 2"; Rec."Comment 2")
            {
                ApplicationArea = all;
                Visible = false;
            }
            field(CommentTxt; CommentTxt)
            {
                Caption = 'Comment';
                ApplicationArea = Comments;

                trigger OnValidate()
                begin
                    Rec.TexttoBlob(CommentTxt);
                end;
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

    actions
    {
        // Add changes to page actions here
    }

    var
        CommentTxt: Text;

    trigger OnAfterGetRecord()
    begin
        CommentTxt := Rec.BlobtoText();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Clear(CommentTxt);
    end;

    trigger OnOpenPage()
    begin

        Rec.SetCurrentKey("Created DateTime");
        Rec.Ascending(false);

    end;






}