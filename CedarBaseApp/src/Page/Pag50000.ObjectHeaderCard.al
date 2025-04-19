page 50000 "Object Header Card"
{

    Caption = 'Company Data Transfer Card';
    PageType = Card;
    SourceTable = "Object Header";

    layout
    {
        area(content)
        {
            group(General)
            {

                field("Company Name"; Rec."Company Name")
                {
                    ToolTip = 'Specifies the value of the Company Name field';
                    ApplicationArea = All;

                }
                field("Dimension Filter"; Rec."Dimension Filter")
                {
                    ToolTip = 'Specifies the value of the Dimension Filter field';
                    ApplicationArea = All;

                }
                field("Last Run Date Time"; Rec."Last Run Date Time")
                {
                    ToolTip = 'Specifies the value of the Last Run Date field';
                    ApplicationArea = All;
                }
                field("Process All Tables"; Rec."Process All Tables")
                {
                    ApplicationArea = All;
                }
                field("Last Table No. Processed"; Rec."Last Table No. Processed")
                {
                    ApplicationArea = All;
                }
                field("No. of Tables"; Rec."No. of Tables")
                {
                    ApplicationArea = All;
                }
                field("No. of Tables Synced"; Rec."No. of Tables Synced")
                {
                    ApplicationArea = All;
                }
            }
            part(ObjectLineDetails; "Object Line Details Subform")
            {
                ApplicationArea = all;
                SubPageLink = "Company Name" = field("Company Name");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(PopulateTables)
            {
                ApplicationArea = All;
                Caption = 'Populate Table in Lines';
                Image = TransferToLines;
                trigger OnAction()
                var
                    ObjectLines: Record "Object Line Details";
                begin
                    Rec.TestField("Company Name");
                    ObjectLines.SetRange("Company Name", Rec."Company Name");
                    if not ObjectLines.IsEmpty then
                        If Not Confirm('Do you want to Delete Existing Object Line & Repopulate all Tables', false) then
                            exit;
                    Rec.PopulateTablesinLines;
                    CurrPage.Update(false);
                end;
            }
            action(TransferDate)
            {
                ApplicationArea = All;
                Caption = 'Transfer Data';
                Image = Process;
                trigger OnAction()
                var
                    ObjectLines: Record "Object Line Details";
                    CopyDataCompany: Codeunit "Copy Data Mgmt MC";
                begin
                    Rec.TestField("Company Name");
                    Rec.TestField("Dimension Filter");
                    ObjectLines.SetRange("Company Name", Rec."Company Name");
                    if ObjectLines.IsEmpty then
                        Error('Please Populate Table Object Lines First');
                    if Not Confirm('Do you want to Send the Data to Company %1', false, Rec."Company Name") then
                        exit;
                    Clear(CopyDataCompany);
                    CopyDataCompany.SendDataToCompany(Rec."Company Name");
                    Message('Records Updated to Company %1', Rec."Company Name");
                    CurrPage.Update(false);
                end;

            }
            action(ClearLastTableNo)
            {
                ApplicationArea = All;
                Caption = 'Clear Last Table No.';
                trigger OnAction()
                var
                    ObjectHdr: Record "Object Header";
                    objectLine: Record "Object Line Details";
                begin
                    ObjectHdr.Get(Rec."Company Name");
                    ObjectHdr."Last Table No. Processed" := 0;
                    ObjectHdr.Modify();

                    objectLine.Reset();
                    objectLine.SetRange("Company Name", Rec."Company Name");
                    objectLine.ModifyAll(Sync, false);
                    objectLine.ModifyAll("Last Error", '');
                end;
            }


        }
    }

}
