codeunit 57001 "Dimension Correction Utility"
{
    Permissions = tabledata "G/L Entry" = rm;

    trigger OnRun()
    var
        CustomDimsCorrectionEntry: Record "Custom Dims Correction Entry";
        CustomDimsCorrectionEntry2: Record "Custom Dims Correction Entry";
        ProcessDimensionCorrection: Codeunit "Process Dimension Correction";
        i: Integer;
        GeneralLedgerSetup: Record "General Ledger Setup";
        UserSetup: Record "User Setup";
    begin
        UserSetup.Get(UserId);
        UserSetup.TestField("Allow Batch Dim Correction");
        GeneralLedgerSetup.Get();
        GeneralLedgerSetup.TestField("No. of batch correct Dims");

        if CustomDimsCorrectionEntry.FindFirst() then
            repeat
                Clear(ProcessDimensionCorrection);
                ProcessDimensionCorrection.SetGLEntryStaging(CustomDimsCorrectionEntry);
                if not ProcessDimensionCorrection.Run() then begin
                    CustomDimsCorrectionEntry2.Get(CustomDimsCorrectionEntry."Entry No.");
                    CustomDimsCorrectionEntry2."Error Message" := CopyStr(GetLastErrorText, 1, 2048);
                    CustomDimsCorrectionEntry2.Modify(true);
                end;
                i += 1;
            until (CustomDimsCorrectionEntry.Next() = 0) or (i = GeneralLedgerSetup."No. of batch correct Dims");
    end;

    [TryFunction]
    procedure SendErrorNotification()
    var
        EMail: Codeunit Email;
        EMailMessage: Codeunit "Email Message";
        Recipients: Text;
        MailCC: List of [Text];
        Subject: Text;
        Body: Text;
        RecRef: RecordRef;
        Title001: Label 'Dimension Correction Notification';
        TitleMsg: Label 'Dear Sir/Madam,<br><br>Dimension Correction batch successfully processed.<br><br>';
        MailID: Text;
        i: Integer;
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.Get();

        if Not GLSetup."Enable Correction Notification" then
            exit;

        if GLSetup."Correction Notification Email" = '' then
            exit;

        Recipients := GLSetup."Correction Notification Email";
        Subject := StrSubstNo(Title001);
        Body := TitleMsg;
        EMailMessage.Create(Recipients, Subject, Body, true);
        If EMail.Send(EMailMessage, Enum::"Email Scenario"::Default) then;
    end;
}
