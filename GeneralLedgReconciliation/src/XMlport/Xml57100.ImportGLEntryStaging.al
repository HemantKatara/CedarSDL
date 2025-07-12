xmlport 57100 "Import G/L Entry Staging"
{
    Caption = 'Import G/L Entry Staging';
    Direction = Import;
    Format = VariableText;
    FieldDelimiter = '"';
    FieldSeparator = ',';
    TextEncoding = UTF8;
    UseRequestPage = false;

    schema
    {
        textelement(Root)
        {
            tableelement(GLStaging; "G/L entry Staging")

            {
                AutoSave = false;
                textelement(EntryNo) { }
                textelement(PostingDate) { }
                textelement(DocumentType) { }
                textelement(DocumentNo) { }
                textelement(Description) { }
                textelement(GLEntriesTag) { }

                trigger OnBeforeInsertRecord()
                var
                    GLStaging: Record "G/L Entry Staging";
                begin
                    i += 1;
                    if i = 1 then
                        currXMLport.Skip();

                    Clear(GLStaging);
                    GLStaging.Init();
                    GLStaging."Entry No." := EvaluateInt(EntryNo);
                    Evaluate(GLStaging."Posting Date", PostingDate);
                    Evaluate(GLStaging."Document Type", DocumentType);
                    GLStaging."Document No." := DocumentNo;
                    GLStaging.Description := Description;
                    GLStaging."G/L Entries Tag" := GLEntriesTag;
                    GLStaging.Insert();
                end;
            }
        }
    }

    trigger OnInitXmlPort()
    begin
        i := 0;
    end;

    var
        i: Integer;

    local procedure EvaluateInt(TextValue: Text): Integer
    var
        IntValue: Integer;
    begin
        Evaluate(IntValue, TextValue);
        exit(IntValue);
    end;
}