report 50501 "Comment transfer"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            dataitem("Comment Line"; "Comment Line")
            {
                trigger OnPreDataItem()
                begin
                    "Comment Line".SetRange("Table Name", "Comment Line"."Table Name"::Customer);
                    "Comment Line".SetRange("No.", Customer."No.");
                end;

                trigger OnAfterGetRecord()
                var
                    TempOutstream: OutStream;
                begin
                    if not UpdateContact then
                        if "Comment Line"."Comment 2" <> '' then begin
                            "Comment Line"."Comment SMDX".CreateOutStream(TempOutstream);
                            TempOutstream.WriteText("Comment Line"."Comment 2");
                            "Comment Line".Modify();
                        end;
                end;
            }
            trigger OnAfterGetRecord()
            begin
                if UpdateContact then
                    if Customer."Primary Contact No." <> '' then begin
                        Customer.Validate("Primary Contact No.");
                        Customer.Modify();
                    end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(UpdateContact; UpdateContact)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
    }
    var
        UpdateContact: Boolean;
}
