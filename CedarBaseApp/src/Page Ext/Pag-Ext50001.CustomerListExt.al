pageextension 50001 "Customer Lists Ext" extends "Customer List"
{
    ContextSensitiveHelpPage = 'sales-how-register-new-customers';
    layout
    {
        // Add changes to page layout here
        modify(Blocked)
        {
            Visible = true;
        }
        modify("Post Code")
        {
            Visible = true;
        }
    }

    actions
    {
        modify(NewSalesBlanketOrder)
        {
            Visible = false;
        }
        modify(NewSalesCrMemo)
        {
            Visible = false;
        }
        modify(NewSalesInvoice)
        {
            Visible = false;
        }
        modify(NewSalesOrder)
        {
            Visible = false;
        }
        modify(NewSalesQuote)
        {
            Visible = false;
        }
        modify(NewSalesReturnOrder)
        {
            Visible = false;
        }

        addafter(NewSalesBlanketOrder)
        {
            group("New Documents")
            {
                action(NewBSO)
                {
                    ApplicationArea = All;
                    Image = BlanketOrder;
                    Caption = 'Blanket Sales Order';
                    Promoted = true;
                    PromotedCategory = Category5;
                    trigger OnAction()
                    begin
                        Rec.SetUserDivision(Rec);
                        Rec.CreateNewDocument(Rec, SalesDocEnum::"Blanket Order");
                    end;
                }
                action(NewSO)
                {
                    ApplicationArea = All;
                    Image = Order;
                    Caption = 'Sales Order';
                    Promoted = true;
                    PromotedCategory = Category5;
                    trigger OnAction()
                    begin
                        Rec.SetUserDivision(Rec);
                        Rec.CreateNewDocument(Rec, SalesDocEnum::Order);
                    end;
                }
                action(NewSI)
                {
                    ApplicationArea = All;
                    Image = SalesInvoice;
                    Caption = 'Sales Invoice';
                    Promoted = true;
                    PromotedCategory = Category5;
                    trigger OnAction()
                    begin
                        Rec.SetUserDivision(Rec);
                        Rec.CreateNewDocument(Rec, SalesDocEnum::Invoice);
                    end;
                }
                action(NewSCM)
                {
                    ApplicationArea = All;
                    Image = SalesCreditMemo;
                    Caption = 'Sales Cr. Memo';
                    Promoted = true;
                    PromotedCategory = Category5;
                    trigger OnAction()
                    begin
                        Rec.SetUserDivision(Rec);
                        Rec.CreateNewDocument(Rec, SalesDocEnum::"Credit Memo");
                    end;
                }
                action(NewRO)
                {
                    ApplicationArea = All;
                    Image = ReturnOrder;
                    Caption = 'Return Order';
                    Promoted = true;
                    PromotedCategory = Category5;
                    trigger OnAction()
                    begin
                        Rec.SetUserDivision(Rec);
                        Rec.CreateNewDocument(Rec, SalesDocEnum::"Return Order");
                    end;
                }
            }
        }

        addafter("Return Orders")
        {
            action("SD Case Manager")
            {
                ApplicationArea = all;
                Caption = 'SD Case Manager';
                Promoted = true;
                PromotedCategory = Category7;

                trigger OnAction()
                var
                    SDYCSMCase: Record "SDY CSM Case";
                begin
                    SDYCSMCase.Reset();
                    SDYCSMCase.SetCurrentKey(ReporterCompanyNo);
                    SDYCSMCase.SetRange(ReporterCompanyNo, Rec."No.");
                    Page.RunModal(Page::"SDY CSM Case List", SDYCSMCase);
                end;
            }
        }

    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Carriage %" := 10;
        Rec."Credit Limit (LCY)" := 5000;
        Rec."Shipment Method Code" := 'STANDARD';
        Rec."Customer Posting Group" := 'DOMESTIC';
        Rec."Payment Terms Code" := '30D';
    end;

    var
        SalesDocEnum: Enum "Sales Document Type";

}