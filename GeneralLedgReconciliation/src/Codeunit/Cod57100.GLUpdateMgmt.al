codeunit 57100 "G/L Update Mgmt"
{
    Permissions = tabledata "G/L Entry" = rm;

    trigger OnRun()
    var
        GLEntryStaging: Record "G/L Entry Staging";
        GLEntryStaging2: Record "G/L Entry Staging";
        ProcessGLEntries: Codeunit "Process G/L Entries";
        i: Integer;
        GeneralLedgerSetup: Record "General Ledger Setup";
        UserSetup: Record "User Setup";
    begin
        UserSetup.Get(UserId);
        UserSetup.TestField("Allow G/L Tag");
        GeneralLedgerSetup.Get();
        GeneralLedgerSetup.TestField("No. of G/L Tag Records");

        if GLEntryStaging.FindFirst() then
            repeat
                Clear(ProcessGLEntries);
                ProcessGLEntries.SetGLEntryStaging(GLEntryStaging);
                if not ProcessGLEntries.Run() then begin
                    GLEntryStaging2.Get(GLEntryStaging."Entry No.");
                    GLEntryStaging2."Error Message" := 'Error occurred while processing entry.';
                    GLEntryStaging2.Modify(true);
                end;
                i += 1;
            until (GLEntryStaging.Next() = 0) or (i = GeneralLedgerSetup."No. of G/L Tag Records");
    end;
}
