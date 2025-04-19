report 50018 "Import Comment Line"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    UseRequestPage = false;

    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = where(Number = const(1));
        }
    }


    trigger OnPreReport()
    begin
        TempExcelBuffer.DeleteAll();
        UploadIntoStream('Please Choose the excel file.', '', '', FromFile, Instr);
        if FromFile <> '' then begin
            Filename := Filemgmt.GetFileName(FromFile);
            sheetName := TempExcelBuffer.SelectSheetsNameStream(Instr);
        end
        else
            Error('No file Found on selected path.');

        TempExcelBuffer.OpenBookStream(Instr, sheetName);
        TempExcelBuffer.ReadSheet();
        ImportFile();
    end;

    trigger OnPostReport()
    begin
        TempExcelBuffer.DeleteAll();
    end;

    var
        Filemgmt: Codeunit "File Management";
        Instr: InStream;
        FromFile: Text;
        Filename: Text;
        sheetName: Text;
        TempExcelBuffer: Record "Excel Buffer";

    local procedure ImportFile()
    var
        CommentLine: Record "Comment Line";
        Rowno: Integer;
        ColNo: Integer;
        MaxRaw: Integer;
        OutStr: OutStream;
        Instr_G: InStream;
        t: Text;
        CommentLineNew: Record "Comment Line";
    begin
        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then
            MaxRaw := TempExcelBuffer."Row No.";

        for Rowno := 2 to MaxRaw do begin
            CommentLine.Reset();
            CommentLine.SetFilter("Table Name", GetValueAtCell(Rowno, 1));
            CommentLine.SetRange("No.", GetValueAtCell(Rowno, 2));
            CommentLine.SetFilter("Line No.", GetValueAtCell(Rowno, 3));
            if CommentLine.FindFirst() then begin
                if GetValueAtCell(Rowno, 4) <> Format(CommentLine."Comment Type") then
                    Evaluate(CommentLine."Comment Type", GetValueAtCell(Rowno, 4));
                if GetValueAtCell(Rowno, 5) <> Format(CommentLine."Created By") then
                    Evaluate(CommentLine."Created By", GetValueAtCell(Rowno, 5));
                if GetValueAtCell(Rowno, 6) <> Format(CommentLine."Created DateTime") then
                    Evaluate(CommentLine."Created DateTime", GetValueAtCell(Rowno, 6));
                if GetValueAtCell(Rowno, 7) <> Format(CommentLine."Modified By") then
                    Evaluate(CommentLine."Modified By", GetValueAtCell(Rowno, 7));
                if GetValueAtCell(Rowno, 8) <> Format(CommentLine."Modified DateTime") then
                    Evaluate(CommentLine."Modified DateTime", GetValueAtCell(Rowno, 8));
                CommentLine."Comment SMDX".CreateOutStream(OutStr);
                TempExcelBuffer.Reset();
                if TempExcelBuffer.Get(Rowno, 9) then begin
                    if TempExcelBuffer."Cell Value as Blob".HasValue then begin
                        TempExcelBuffer.CalcFields("Cell Value as Blob");
                        TempExcelBuffer."Cell Value as Blob".CreateInStream(Instr_G);
                        CopyStream(OutStr, Instr_G);
                    end else
                        OutStr.WriteText(TempExcelBuffer."Cell Value as Text");
                end;
                CommentLine.Modify();
            end else begin
                CommentLineNew.Init();
                Evaluate(CommentLineNew."Table Name", GetValueAtCell(Rowno, 1));
                CommentLineNew."No." := GetValueAtCell(Rowno, 2);
                Evaluate(CommentLineNew."Line No.", GetValueAtCell(Rowno, 3));
                Evaluate(CommentLineNew."Comment Type", GetValueAtCell(Rowno, 4));
                if GetValueAtCell(Rowno, 5) <> '' then
                    Evaluate(CommentLineNew."Created By", GetValueAtCell(Rowno, 5));
                if GetValueAtCell(Rowno, 6) <> '' then
                    Evaluate(CommentLineNew."Created DateTime", GetValueAtCell(Rowno, 6));
                if GetValueAtCell(Rowno, 7) <> '' then
                    Evaluate(CommentLineNew."Modified By", GetValueAtCell(Rowno, 7));
                if GetValueAtCell(Rowno, 8) <> '' then
                    Evaluate(CommentLineNew."Modified DateTime", GetValueAtCell(Rowno, 8));
                CommentLineNew."Comment SMDX".CreateOutStream(OutStr);
                TempExcelBuffer.Reset();
                if TempExcelBuffer.Get(Rowno, 9) then begin
                    if TempExcelBuffer."Cell Value as Blob".HasValue then begin
                        TempExcelBuffer.CalcFields("Cell Value as Blob");
                        TempExcelBuffer."Cell Value as Blob".CreateInStream(Instr_G);
                        CopyStream(OutStr, Instr_G);
                    end else
                        OutStr.WriteText(TempExcelBuffer."Cell Value as Text");
                    CommentLineNew.Insert()
                end;
            end;
        end;
    end;

    local procedure GetValueAtCell(RNo: Integer; CNo: Integer): Text
    begin
        TempExcelBuffer.Reset();
        If TempExcelBuffer.Get(RNo, CNo) then
            exit(TempExcelBuffer."Cell Value as Text")
        else
            exit('');
    end;

}

