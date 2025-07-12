codeunit 57101 "Process G/L Entries"
{
    Permissions = tabledata "G/L Entry" = rm;

    trigger OnRun()
    begin
        processGLEntries();
    end;


    local procedure processGLEntries()
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.Get(g_GLEntryStaging."Entry No.");
        GLEntry."G/L Entries Tag" := g_GLEntryStaging."G/L Entries Tag";
        GLEntry.Modify(true);
        g_GLEntryStaging.Delete();
    end;

    procedure SetGLEntryStaging(GLEntryStaging: Record "G/L Entry Staging")
    begin
        g_GLEntryStaging := GLEntryStaging;
    end;

    var
        g_GLEntryStaging: Record "G/L Entry Staging";
}
