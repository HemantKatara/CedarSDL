codeunit 57002 "Process Dimension Correction"
{
    Permissions = tabledata "G/L Entry" = rm;

    trigger OnRun()
    var
        F: Record "Dim Correction Change";
    begin
        processGLEntries();
    end;


    local procedure processGLEntries()
    var
        GLEntry: Record "G/L Entry";
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
        DimMgt: Codeunit DimensionManagement;
        DimValue: Record "Dimension Value";
    begin
        GLEntry.Get(g_CustomDimsCorrectionEntry."Entry No.");
        TempDimSetEntry.DeleteAll();
        DimMgt.GetDimensionSet(TempDimSetEntry, GLEntry."Dimension Set ID");

        DimValue.GET(g_CustomDimsCorrectionEntry."Dimension Code", g_CustomDimsCorrectionEntry."New Dimension Value Code");

        if TempDimSetEntry.Get(GLEntry."Dimension Set ID", g_CustomDimsCorrectionEntry."Dimension Code") then
            TempDimSetEntry.Delete();

        TempDimSetEntry.INIT;
        TempDimSetEntry."Dimension Code" := g_CustomDimsCorrectionEntry."Dimension Code";
        TempDimSetEntry."Dimension Value Code" := g_CustomDimsCorrectionEntry."New Dimension Value Code";
        TempDimSetEntry."Dimension Value ID" := DimValue."Dimension Value ID";
        TempDimSetEntry.INSERT;


        GLEntry."Dimension Set ID" := DimMgt.GetDimensionSetID(TempDimSetEntry);

        DimMgt.UpdateGlobalDimFromDimSetID(GLEntry."Dimension Set ID", GLEntry."Global Dimension 1 Code", GLEntry."Global Dimension 2 Code");

        GLEntry.Modify();
    end;



    procedure SetGLEntryStaging(CustomDimsCorrectionEntry: Record "Custom Dims Correction Entry")
    begin
        g_CustomDimsCorrectionEntry := CustomDimsCorrectionEntry;

    end;




    var
        g_CustomDimsCorrectionEntry: Record "Custom Dims Correction Entry";
}
