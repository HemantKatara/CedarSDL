report 50017 "Export Comment Line"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;


    dataset
    {
        dataitem("Comment Line"; "Comment Line")
        {
            RequestFilterFields = "Table Name";



            trigger OnAfterGetRecord()
            begin
                CreateBody();
            end;
        }

    }

    trigger OnPreReport()
    begin
        CreateHeader();
    end;

    trigger OnPostReport()
    begin
        ExporttoExcel();
    end;

    var
        ExcelBuff: Record "Excel Buffer" temporary;


    local procedure CreateHeader()
    begin
        ExcelBuff.AddColumn('Table Name', false, '', true, false, false, '', ExcelBuff."Cell Type"::Text);
        ExcelBuff.AddColumn('No.', false, '', true, false, false, '', ExcelBuff."Cell Type"::Text);
        ExcelBuff.AddColumn('Line No.', false, '', true, false, false, '', ExcelBuff."Cell Type"::Number);
        ExcelBuff.AddColumn('Comment Type', false, '', true, false, false, '', ExcelBuff."Cell Type"::Text);
        ExcelBuff.AddColumn('Created By', false, '', true, false, false, '', ExcelBuff."Cell Type"::Text);
        ExcelBuff.AddColumn('Created DateTime', false, '', true, false, false, '', ExcelBuff."Cell Type"::Text);
        ExcelBuff.AddColumn('Modified By', false, '', true, false, false, '', ExcelBuff."Cell Type"::Text);
        ExcelBuff.AddColumn('Modified DateTime', false, '', true, false, false, '', ExcelBuff."Cell Type"::Text);
        ExcelBuff.AddColumn('Comment', false, '', true, false, false, '', ExcelBuff."Cell Type"::Text);
    end;

    local procedure CreateBody()
    var
        Instr: InStream;
        CommentTxt: Text;
        outStr: OutStream;
    begin
        Clear(CommentTxt);
        ExcelBuff.NewRow();
        ExcelBuff.AddColumn("Comment Line"."Table Name", false, '', false, false, false, '', ExcelBuff."Cell Type"::Text);
        ExcelBuff.AddColumn("Comment Line"."No.", false, '', false, false, false, '', ExcelBuff."Cell Type"::Text);
        ExcelBuff.AddColumn("Comment Line"."Line No.", false, '', false, false, false, '', ExcelBuff."Cell Type"::Number);
        ExcelBuff.AddColumn("Comment Line"."Comment Type", false, '', false, false, false, '', ExcelBuff."Cell Type"::Text);
        ExcelBuff.AddColumn("Comment Line"."Created By", false, '', false, false, false, '', ExcelBuff."Cell Type"::Text);
        ExcelBuff.AddColumn("Comment Line"."Created DateTime", false, '', false, false, false, '', ExcelBuff."Cell Type"::Text);
        ExcelBuff.AddColumn("Comment Line"."Modified By", false, '', false, false, false, '', ExcelBuff."Cell Type"::Text);
        ExcelBuff.AddColumn("Comment Line"."Modified DateTime", false, '', false, false, false, '', ExcelBuff."Cell Type"::Text);
        "Comment Line".CalcFields("Comment SMDX");
        if "Comment Line"."Comment SMDX".HasValue then begin
            "Comment Line"."Comment SMDX".CreateInStream(Instr);
            //Instr.ReadText(CommentTxt);
            ExcelBuff.AddColumn(CommentTxt, false, '', false, false, false, '', ExcelBuff."Cell Type"::Text);
            ExcelBuff."Cell Value as Blob".CreateOutStream(outStr);
            CopyStream(outStr, Instr);
            ExcelBuff.Modify();
        end else
            ExcelBuff.AddColumn('Comment', false, '', false, false, false, '', ExcelBuff."Cell Type"::Text);
    end;

    local procedure ExporttoExcel()
    begin
        ExcelBuff.CreateNewBook('Comment');
        ExcelBuff.WriteSheet('Comment Sheet', CompanyName, UserId);
        ExcelBuff.CloseBook();
        ExcelBuff.SetFriendlyFilename('Comment Sheet');
        ExcelBuff.OpenExcel();

    end;
}