codeunit 50000 "CopyDataMultipleCompanies"
{
    trigger OnRun()
    begin
        CopyTableData();
    end;

    PROCEDURE CopyTableData()
    VAR
        LocSourceTable: RecordRef;
        LocIntRecordCounter: Integer;
        LocTargetTable: RecordRef;
        LocIntCounter: Integer;
        LocSourceField: FieldRef;
        LocTargetField: FieldRef;
        TgFieldNo: Integer;
        IsLedgerEntry: Boolean;
        tgFieldNo2: Integer;
    BEGIN
        ClearLastError();
        ObjectHeader.get(SendToCompany);
        if ObjectLineDetails."Last Entry No." <> 0 then
            OldEntryNo := ObjectLineDetails."Last Entry No.";
        ParObjectId := ObjectLineDetails."Table No.";
        TgFieldNo := GetRelatedFieldNo(ParObjectId, 'Global Dimension 1 Code');
        if TgFieldNo = 0 then
            TgFieldNo := GetRelatedFieldNo(ParObjectId, 'Shortcut Dimension 1 Code');
        tgFieldNo2 := GetRelatedFieldNo(ParObjectId, 'Entry No.');
        LocTargetTable.OPEN(ParObjectId, FALSE, SendToCompany);
        LocSourceTable.OPEN(ParObjectId, FALSE, CompanyName);
        if TgFieldNo <> 0 then begin
            LocSourceField := LocSourceTable.Field(TgFieldNo);
            LocSourceField.SetFilter(ObjectHeader."Dimension Filter");
        end;
        if OldEntryNo <> 0 then Begin
            LocSourceField := LocSourceTable.Field(1);
            LocSourceField.SetFilter('>%1', OldEntryNo);
        End;
        IF LocSourceTable.FIND('-') THEN BEGIN
            LocIntRecordCounter := 0;
            REPEAT
                LocIntRecordCounter += 1;
                LocTargetTable.INIT();
                FOR LocIntCounter := 1 TO LocSourceTable.FIELDCOUNT() DO BEGIN
                    LocSourceField := LocSourceTable.FIELDINDEX(LocIntCounter);
                    LocTargetField := LocTargetTable.FIELD(LocSourceField.NUMBER);
                    LocTargetField.VALUE(LocSourceField.VALUE);
                    if (tgFieldNo2 = 1) AND (LocIntCounter = 1) and (LocSourceField.Type = LocSourceField.Type::Integer) then
                        LastEntryNo := LocSourceField.VALUE;
                END;
                IF LocTargetTable.INSERT(FALSE) THEN;
                LastRecordID := LocTargetTable.RecordId;
            UNTIL LocSourceTable.NEXT = 0;
        END;
        LocTargetTable.CLOSE();
        LocSourceTable.CLOSE();
        ObjectHeader."Last Run Date Time" := CurrentDateTime;
        ObjectHeader."Last Table No. Processed" := ParObjectId;
        ObjectHeader.Modify();
    END;

    procedure ExitLastRecord(): RecordId
    begin
        exit(LastRecordID)
    end;

    procedure ExitLastEntryNo(): Integer
    begin
        exit(LastEntryNo)
    end;

    local procedure GetRelatedFieldNo(LObjectID: integer; LFieldName: Text[30]): Integer
    var
        RecField: Record Field;
        TgFieldNo: Integer;
        RecField2: Record Field;
    begin
        RecField.Reset();
        RecField.SetRange(TableNo, LObjectID);
        RecField.SetRange(FieldName, LFieldName);
        if RecField.FindFirst() then
            Exit(RecField."No.");
        exit(0);
    end;


    procedure SetObjectLineData(LObjectLineDetails: Record "Object Line Details"; LSendToCompany: Text)
    begin
        ObjectLineDetails := LObjectLineDetails;
        SendToCompany := LSendToCompany;
    end;

    var
        ObjectLineDetails: Record "Object Line Details";
        SendToCompany: Text;
        ObjectHeader: Record "Object Header";
        LastEntryNo: Integer;

        OldEntryNo: Integer;
        ParObjectId: Integer;
        LastRecordID: RecordId;
}
