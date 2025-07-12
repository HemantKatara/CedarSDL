page 57100 "G/L Entries Tag"
{
    ApplicationArea = All;
    Caption = 'G/L Entries Tags';
    PageType = List;
    SourceTable = "G/L Entry Staging";
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
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                    Editable = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the entry''s posting date.';
                    Editable = false;

                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the document type that the entry belongs to.';
                    Editable = false;

                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the entry''s Document No.';
                    Editable = false;

                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a description of the entry.';
                    Editable = false;

                }
                field("Error Message"; Rec."Error Message")
                {
                    ToolTip = 'Specifies the error message if any error occurred during import.';
                    Editable = false;

                }
                field("G/L Entries Tag"; Rec."G/L Entries Tag")
                {
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
                Caption = 'Apply G/L Entry Tag';
                Image = UpdateDescription;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    GLEntry: Record "G/L Entry";
                    userSetup: Record "User Setup";
                    GLEntryStagging: Record "G/L Entry Staging";
                begin
                    if not Confirm('Are you sure you want to update the G/L Tag for the selected entries?') then
                        exit;
                    if Rec.IsEmpty() then
                        Error('No entries for updating.');

                    UserSetup.Get(UserId);
                    UserSetup.TestField("Allow G/L Tag");
                    CurrPage.SetSelectionFilter(GLEntryStagging);
                    If GLEntryStagging.FindFirst() then
                        repeat
                            GLEntry.Get(GLEntryStagging."Entry No.");
                            GLEntry."G/L Entries Tag" := GLEntryStagging."G/L Entries Tag";
                            GLEntry.Modify(true);
                        until GLEntryStagging.Next() = 0;
                    GLEntryStagging.DeleteAll();
                end;
            }
            action(ImportFromCSV)
            {
                ApplicationArea = All;
                Caption = 'Import from CSV File';
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Xmlport "Import G/L Entry Staging";
                ToolTip = 'Import format : Entry No., Posting Date, Document Type, Document No., Description, G/L Entries Tag';
                trigger OnAction()
                begin
                    CurrPage.Update(false);
                end;
            }
        }
    }

}
