xmlport 57001 "Import Dim Correction Entry"
{
    Caption = 'Import Dim Correction Entry';
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
            tableelement(DimsCorrectionEntry; "Custom Dims Correction Entry")

            {
                AutoSave = false;
                textelement(EntryNo) { }
                textelement(PostingDate) { }
                textelement(DocumentType) { }
                textelement(DocumentNo) { }
                textelement(Description) { }
                textelement(DimensionCode) { }
                textelement(DimensionValueCode) { }
                textelement(NewDimensionValueCode) { }
                trigger OnBeforeInsertRecord()
                var
                    CustomDimsCorrectionEntry: Record "Custom Dims Correction Entry";
                    DimValue: Record "Dimension Value";
                begin
                    i += 1;
                    if i = 1 then
                        currXMLport.Skip();

                    if DimensionCode = '' then
                        Error('Dimension Code cannot be empty.');

                    if NewDimensionValueCode = '' then
                        Error('New Dimension Value Code cannot be empty.');

                    DimValue.GET(DimensionCode, NewDimensionValueCode);

                    Clear(CustomDimsCorrectionEntry);
                    CustomDimsCorrectionEntry.Init();
                    CustomDimsCorrectionEntry."Entry No." := EvaluateInt(EntryNo);
                    Evaluate(CustomDimsCorrectionEntry."Posting Date", PostingDate);
                    Evaluate(CustomDimsCorrectionEntry."Document Type", DocumentType);
                    CustomDimsCorrectionEntry."Document No." := DocumentNo;
                    CustomDimsCorrectionEntry.Description := Description;
                    CustomDimsCorrectionEntry."Dimension Code" := DimensionCode;
                    CustomDimsCorrectionEntry."Dimension Value Code" := DimensionValueCode;
                    CustomDimsCorrectionEntry."New Dimension Value Code" := NewDimensionValueCode;
                    CustomDimsCorrectionEntry.Insert();
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