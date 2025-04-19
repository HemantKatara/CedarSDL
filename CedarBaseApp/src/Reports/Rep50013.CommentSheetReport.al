report 50013 "Comment Sheet Report"
{
    ApplicationArea = All;
    Caption = 'Comment Sheet Report';
    UsageCategory = Administration;
    PreviewMode = PrintLayout;
    RDLCLayout = './layout/CommentSheet.rdl';
    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.";
            column(No_; "No.")
            {

            }

            dataitem("Comment Line"; "Comment Line")
            {
                RequestFilterFields = "Comment Type";
                DataItemTableView = sorting("Created DateTime") order(descending) Where("Table Name" = filter(Customer));
                DataItemLink = "No." = FIELD("No.");

                column(Sequence_No_; "line no.")
                {

                }
                column(Created_By; UserName)
                {

                }
                column(Code; Code)
                {

                }
                column(Comment; Comment)
                {

                }
                column(Comment_Type; "Comment Type")
                {

                }
                column(Comment_TempCommentLine; CommentTxt)
                {

                }
                column(Date_TempCommentLine; FORMAT(DT2Date("Comment Line"."Created DateTime"), 0, '<Day,2>.<Month,2>.<Year,2>'))
                {

                }
                column(Created_DateTime; "Created DateTime")
                {

                }


                trigger OnAfterGetRecord()
                var
                    Instr_L: InStream;
                begin
                    Clear(UserName);
                    user.Reset();
                    User.SetRange("User Name", "Created By");
                    if user.FindFirst() then
                        if user."Full Name" <> '' then
                            UserName := user."Full Name"
                        else
                            UserName := user."User Name";

                    Clear(CommentTxt);
                    if "Comment Line"."Comment SMDX".HasValue then begin
                        "Comment Line".CalcFields("Comment SMDX");
                        "Comment Line"."Comment SMDX".CreateInStream(Instr_L);
                        Instr_L.ReadText(CommentTxt);
                    end;

                end;
            }
            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
            end;


        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }

    }
    var
        user: Record User;
        UserName: text[100];
        CommentTxt: Text;

}
