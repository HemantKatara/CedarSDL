page 57001 "Dimension Correction Entries"
{
    ApplicationArea = All;
    Caption = 'Dimension Correction Entries';
    PageType = List;
    SourceTable = "Custom Dims Correction Entry";
    UsageCategory = Administration;
    DelayedInsert = true;
    Permissions = tabledata "G/L Entry" = rm;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                    Editable = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the entry''s posting date.';
                    Editable = false;

                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the document type that the entry belongs to.';
                    Editable = false;

                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the entry''s Document No.';
                    Editable = false;

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a description of the entry.';
                    Editable = false;
                }
                field("Dimension Code"; Rec."Dimension Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dimension Code field.', Comment = '%';
                    Editable = false;
                }
                field("Dimension Value Code"; Rec."Dimension Value Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dimension Value Code field.', Comment = '%';
                    Editable = false;
                }
                field("New Dimension Value Code"; Rec."New Dimension Value Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the New Dimension Value Code field.', Comment = '%';
                    Editable = false;
                }

                field("Error Message"; Rec."Error Message")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the error message if any error occurred during import.';
                    Editable = false;
                }

            }
        }
    }

    actions
    {
        area(processing)
        {
            action(UpdateStatus)
            {
                ApplicationArea = All;
                Caption = 'Apply Dimension Corrections';
                Image = UpdateDescription;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    GLEntry: Record "G/L Entry";
                    userSetup: Record "User Setup";
                    CustomDimsCorrectionEntry: Record "Custom Dims Correction Entry";
                    TempDimSetEntry: Record "Dimension Set Entry" temporary;
                    DimMgt: Codeunit DimensionManagement;
                    DimValue: Record "Dimension Value";
                begin
                    if not Confirm('Are you sure you want to update the G/L Tag for the selected entries?') then
                        exit;
                    if Rec.IsEmpty() then
                        Error('No entries for updating.');

                    UserSetup.Get(UserId);
                    UserSetup.TestField("Allow Batch Dim Correction");
                    CurrPage.SetSelectionFilter(CustomDimsCorrectionEntry);
                    If CustomDimsCorrectionEntry.FindFirst() then
                        repeat
                            GLEntry.Get(CustomDimsCorrectionEntry."Entry No.");
                            TempDimSetEntry.DeleteAll();
                            DimMgt.GetDimensionSet(TempDimSetEntry, GLEntry."Dimension Set ID");

                            DimValue.GET(CustomDimsCorrectionEntry."Dimension Code", CustomDimsCorrectionEntry."New Dimension Value Code");

                            if TempDimSetEntry.Get(GLEntry."Dimension Set ID", CustomDimsCorrectionEntry."Dimension Code") then
                                TempDimSetEntry.Delete();

                            TempDimSetEntry.INIT;
                            TempDimSetEntry."Dimension Code" := CustomDimsCorrectionEntry."Dimension Code";
                            TempDimSetEntry."Dimension Value Code" := CustomDimsCorrectionEntry."New Dimension Value Code";
                            TempDimSetEntry."Dimension Value ID" := DimValue."Dimension Value ID";
                            TempDimSetEntry.INSERT;


                            GLEntry."Dimension Set ID" := DimMgt.GetDimensionSetID(TempDimSetEntry);

                            DimMgt.UpdateGlobalDimFromDimSetID(GLEntry."Dimension Set ID", GLEntry."Global Dimension 1 Code", GLEntry."Global Dimension 2 Code");

                            GLEntry.Modify();
                        until CustomDimsCorrectionEntry.Next() = 0;
                    CustomDimsCorrectionEntry.DeleteAll();
                end;
            }
            action("Import from csv File")
            {
                ApplicationArea = All;
                Caption = 'Import from csv File';
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Xmlport "Import Dim Correction Entry";
                ToolTip = 'Import format : Entry No., Posting Date, Document Type, Document No., Description, Dimension Code, Dimension Value Code, New Dimension Value Code';
                trigger OnAction()
                begin
                    CurrPage.Update(false);
                end;
            }
        }
    }

}
