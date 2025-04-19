codeunit 50001 "Copy Data Mgmt MC"
{
    TableNo = "Job Queue Entry";
    trigger OnRun()
    begin
        if Rec."Parameter String" <> '' then
            SendDatatoCompany(Rec."Parameter String");
    end;


    procedure SendDataToCompany(SendToCompany: Text[30])
    var
        ObjectLineDetails: Record "Object Line Details";
        UpdateContDimension: Codeunit "Update Contact Dimension";
    Begin
        Clear(UpdateContDimension);
        UpdateContDimension.Run();
        if GuiAllowed then
            Wind.Open('Transferring Table ID #1##########');
        ObjectHeader.Get(SendToCompany);
        ObjectLineDetails.RESET();
        ObjectLineDetails.SETRANGE("Company Name", SendToCompany);
        if ObjectHeader."Last Table No. Processed" <> 0 then
            ObjectLineDetails.SetFilter("Table No.", '>%1', ObjectHeader."Last Table No. Processed");
        ObjectLineDetails.SETRANGE("Process Table", true);
        ObjectLineDetails.SETRANGE("Skip Processing", false);
        IF ObjectLineDetails.FIND('-') THEN BEGIN
            REPEAT
                Clear(CUCpoyData);
                if GuiAllowed then
                    Wind.Update(1, format(ObjectLineDetails."Table No.") + ' ' + ObjectLineDetails."Table Name");
                CUCpoyData.SetObjectLineData(ObjectLineDetails, SendToCompany);
                if Not CUCpoyData.Run() then begin
                    ObjectLineDetails."Last Error" := GetLastErrorText();
                    ObjectLineDetails.Sync := false;
                end
                else begin
                    ObjectLineDetails."Last Error" := '';
                    ObjectLineDetails.Sync := true;
                end;
                ObjectLineDetails."Last Entry No." := CUCpoyData.ExitLastEntryNo();
                ObjectLineDetails."Last Record ID" := CUCpoyData.ExitLastRecord();

                ObjectLineDetails."Last Run Date Time" := CurrentDateTime;
                ObjectLineDetails.Modify();
                Commit();
            UNTIL ObjectLineDetails.NEXT = 0;
        END;
        if GuiAllowed then
            Wind.Close();
    End;


    var
        SendToCompany: Text[30];
        ObjectHeader: Record "Object Header";
        Wind: Dialog;
        CUCpoyData: Codeunit CopyDataMultipleCompanies;
}
