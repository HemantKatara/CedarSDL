pageextension 50003 "Customer Card Ext" extends "Customer Card"
{
    ContextSensitiveHelpPage = 'sales-how-register-new-customers';
    layout
    {
        addafter(General)
        {
            part(CustComment; "Comment Sheet Subpage")
            {
                ApplicationArea = all;

                SubPageLink = "Table Name" = CONST(Customer),
                                  "No." = FIELD("No.");
            }
        }
        addafter("Balance (LCY)")
        {
            Field("Carriage %"; Rec."Carriage %")
            {
                ApplicationArea = all;
            }
            field("No of employee"; Rec."No of employee")
            {
                ApplicationArea = all;
            }
            field("Customer Industry"; Rec."Customer Industry")
            {
                ApplicationArea = all;
            }
            field("Hide Price"; Rec."Hide Price")
            {
                ApplicationArea = all;
                ToolTip = 'Place a check mark if you want to Hide Price column in BSO, SO report';
            }
        }
        addafter(ContactName)
        {
            field("Contact Home Address"; Rec."Contact Home Address SMDX")
            {
                ApplicationArea = all;
                Caption = 'Home Address';
            }
            field("Contact County"; Rec."Contact County")
            {
                ApplicationArea = all;
                Caption = 'County';
            }
            field("Contact Post Code"; Rec."Contact Post Code")
            {
                ApplicationArea = All;

            }
            field("Contact Phone No."; Rec."Contact Phone No.")
            {
                ApplicationArea = All;
                Caption = 'Phone No.';
            }
            field("Contact Mobile Phone No."; Rec."Contact Mobile Phone No.")
            {
                ApplicationArea = All;
                Caption = 'Mobile Phone No.';
            }
            field("Contact E-Mail"; Rec."Contact E-Mail SMDX")
            {
                ApplicationArea = All;
                Caption = 'E-Mail';
            }
            field("Salutation Code"; Rec."Salutation Code")
            {
                ApplicationArea = All;
                Caption = 'Salutation Code';
                Visible = false;
            }
            field("Salutation Description"; Rec."Salutation Description")
            {
                ApplicationArea = All;
                Caption = 'Salutation Code';
            }

        }
        addbefore(Blocked)
        {
            field(Favourite; Rec.Favourite)
            {
                ApplicationArea = all;
                Caption = 'Favourite';
            }
        }


    }
    actions
    {
        modify(NewBlanketSalesOrder)
        {
            Visible = false;
        }
        modify(NewSalesCreditMemo)
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

        addafter(NewBlanketSalesOrder)
        {
            group("New Documents")
            {
                action(NewBSO)
                {
                    ApplicationArea = All;
                    Image = BlanketOrder;
                    Caption = 'Blanket Sales Order';
                    Promoted = true;
                    PromotedCategory = Category4;
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
                    PromotedCategory = Category4;
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
                    PromotedCategory = Category4;
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
                    PromotedCategory = Category4;
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
                    PromotedCategory = Category4;
                    trigger OnAction()
                    begin
                        Rec.SetUserDivision(Rec);
                        Rec.CreateNewDocument(Rec, SalesDocEnum::"Return Order");
                    end;
                }

            }

        }
        addafter("Item References")
        {
            action("SD Case Manager")
            {
                ApplicationArea = all;
                Caption = 'SD Case Manager';
                Promoted = true;
                PromotedCategory = Category9;
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
        cust: Record Customer;
}
