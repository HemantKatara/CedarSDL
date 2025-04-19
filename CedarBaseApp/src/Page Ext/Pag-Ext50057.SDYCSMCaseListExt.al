pageextension 50057 "SDY CSM Case List Ext" extends "SDY CSM Case List"
{
    layout
    {
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
            field("SDY Customer No."; Rec."SDY Customer No.")
            {
                ApplicationArea = all;

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
            field("SDY Customer Name"; Rec."SDY Customer Name")
            {
                ApplicationArea = all;

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
        addbefore("Created by")
        {
            field("Amount Paid Total"; Rec."Amount Paid Total")
            {
                ApplicationArea = all;
            }

            field("Amount Ongoing Sales Orders"; Rec."Amount Ongoing Sales Orders")
            {
                ApplicationArea = all;
            }
            field("Amount Unpaid Invoice"; Rec."Amount Unpaid Invoice")
            {
                ApplicationArea = all;
            }
            field("Last Paid Date"; Rec."Last Paid Date")
            {
                ApplicationArea = all;
            }

        }
        addafter("Customer Name")
        {
            field(Favourite; Rec.Favourite)
            {
                ApplicationArea = all;
                Caption = 'Favourite';
            }
        }
    }
    trigger OnOpenPage()
    begin
        //SDYCase.Reset();
        // SDYCase.CopyFilters(Rec);
        // IsHandled := false;
        SDYCaseTEMP.DeleteAll();
    end;

    trigger OnAfterGetRecord()
    Var
    // CustomerRec: Record Customer;
    begin
        if Not SDYCaseTEMP.Get(Rec."No.") then begin
            SDYCase.Get(Rec."No.");
            SDYCase.CalcFields(ReporterCompanyNo, ReporterCompanyName);
            if CustomerRec.Get(SDYCase.ReporterCompanyNo) then begin
                CustomerRec.CalcFields("Shipped Not Invoiced (LCY)", "Balance Due (LCY)");
                SDYCase."Amount Paid Total" := SDYCase.GetTotalPaidAmount(CustomerRec."No.");
                SDYCase."Amount Ongoing Sales Orders" := CustomerRec."Shipped Not Invoiced (LCY)";
                SDYCase."Amount Unpaid Invoice" := CustomerRec."Balance Due (LCY)";
                SDYCase."Last Paid Date" := SDYCase.GetLastPaidDate(CustomerRec."No.");
                SDYCase."SDY Customer No." := CustomerRec."No.";
                SDYCase."SDY Customer Name" := CustomerRec.Name;
                SDYCase.Modify();
            end;
            SDYCaseTEMP.Init();
            SDYCaseTEMP."No." := SDYCase."No.";
            SDYCaseTEMP.Insert();
        end;
    end;



    Var
        IsHandled: Boolean;
        SDYCase: Record "SDY CSM Case";
        CustomerRec: Record Customer;

        SDYCaseTEMP: Record "SDY CSM Case" temporary;
}