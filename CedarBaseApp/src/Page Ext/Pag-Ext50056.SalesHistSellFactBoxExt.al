pageextension 50056 "Sales Hist. Sell FactBox Ext." extends "Sales Hist. Sell-to FactBox"
{
    layout
    {
        addafter(NoofPstdCreditMemosTile)
        {
            field("No. of BSO Open"; Rec."No. of BSO Open")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'BSO Pending';

                trigger OnDrillDown()
                begin
                    SalesHdr.Reset();
                    SalesHdr.SetRange("Document Type", SalesHdr."Document Type"::"Blanket Order");
                    SalesHdr.SetRange("Sell-to Customer No.", Rec."No.");
                    SalesHdr.SetRange(Status, SalesHdr.Status::Open);
                    SalesHdr.SetRange(Cancelled, false);
                    if SalesHdr.FindSet() then begin
                        BSO.SetFilter(true, SalesHdr);
                        BSO.Run();
                    end;
                end;
            }
            field("No. of BSO Released"; Rec."No. of BSO Released")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'BSO Verified';

                trigger OnDrillDown()
                begin
                    SalesHdr.Reset();
                    SalesHdr.SetRange("Document Type", SalesHdr."Document Type"::"Blanket Order");
                    SalesHdr.SetRange("Sell-to Customer No.", Rec."No.");
                    SalesHdr.SetRange(Status, SalesHdr.Status::Released);
                    SalesHdr.SetRange(Cancelled, false);
                    if SalesHdr.FindSet() then begin
                        BSO.SetFilter(true, SalesHdr);
                        BSO.Run();
                    end;
                end;
            }
        }

    }


    actions
    {
        // Add changes to page actions here
    }
    trigger OnAfterGetRecord()
    begin
    end;

    var
        SalesHdr: Record "Sales Header";
        BSO: Page "Blanket Sales Orders";



}