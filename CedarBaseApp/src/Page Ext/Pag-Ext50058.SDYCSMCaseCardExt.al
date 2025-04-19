pageextension 50058 "SDY CSM Case Card Ext" extends "SDY CSM Case Card"
{


    layout
    {


        addafter(CaseContactLP)
        {
            part(CustComment; "Comment Sheet Subpage")
            {
                ApplicationArea = all;
                SubPageLink = "Table Name" = CONST(Customer),
                                  "No." = FIELD("SDY Customer No.");
                Visible = ShowCommentSheet;
            }
        }

        modify("Customer No")
        {
            Visible = false;
        }
        modify("Customer Name")
        {
            Visible = false;
        }
        addafter("Salesperson Name")
        {
            field("SDY Customer No."; rec.ReporterCompanyNo)
            {
                ApplicationArea = all;
                Caption = 'Customer No.';

                trigger OnDrillDown()
                var
                    Cust: Record Customer;
                begin
                    Rec.CalcFields(ReporterCompanyNo);
                    Cust.Reset();
                    Cust.SetRange("No.", Rec.ReporterCompanyNo);
                    if Cust.FindFirst() then
                        Page.Run(Page::"Customer List", Cust);
                end;
            }
            field("SDY Customer Name"; rec.ReporterCompanyName)
            {
                ApplicationArea = all;
                Caption = 'Customer Name';

                trigger OnDrillDown()
                var
                    Cust: Record Customer;
                begin
                    Rec.CalcFields(ReporterCompanyNo);
                    Cust.Reset();
                    Cust.SetRange("No.", Rec.ReporterCompanyNo);
                    if Cust.FindFirst() then
                        Page.Run(Page::"Customer List", Cust);
                end;
            }
        }


    }
    actions
    {
        addafter("Email Case Contact")
        {
            action("Show Comment Sheet")
            {
                ApplicationArea = All;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    CurrPage.Update();
                    if Rec."SDY Customer No." <> '' then
                        ShowCommentSheet := true;
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.CalcFields(ReporterCompanyNo);
        if Rec.ReporterCompanyNo <> '' then
            ShowCommentSheet := true;
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields(ReporterCompanyNo, ReporterCompanyName);
        Rec."SDY Customer No." := Rec.ReporterCompanyNo;
        Rec."SDY Customer Name" := Rec.ReporterCompanyName;
    end;





    var
        ShowCommentSheet: Boolean;
}