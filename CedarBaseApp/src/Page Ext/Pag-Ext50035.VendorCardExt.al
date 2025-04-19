pageextension 50035 "Vendor Card Ext" extends "Vendor Card"
{
    ContextSensitiveHelpPage = 'purchasing-how-register-new-vendors';
    actions
    {
        modify(NewBlanketPurchaseOrder)
        {
            Visible = false;
        }
        modify(NewPurchaseCrMemo)
        {
            Visible = false;
        }
        modify(NewPurchaseInvoice)
        {
            Visible = false;
        }
        modify(NewPurchaseOrder)
        {
            Visible = false;
        }
        modify(NewPurchaseQuote)
        {
            Visible = false;
        }
        modify(NewPurchaseReturnOrder)
        {
            Visible = false;
        }

        addafter(NewBlanketPurchaseOrder)
        {
            group("New Documents")
            {
                action(NewBSO)
                {
                    ApplicationArea = All;
                    Image = BlanketOrder;
                    Caption = 'Blanket Purchase Order';
                    Promoted = true;
                    PromotedCategory = Category6;
                    trigger OnAction()
                    begin
                        Rec.SetUserDivision(Rec);
                        Rec.CreateNewDocument(Rec, PurchDocType::"Blanket Order");
                    end;
                }
                action(NewSO)
                {
                    ApplicationArea = All;
                    Image = Order;
                    Caption = 'Purchase Order';
                    Promoted = true;
                    PromotedCategory = Category6;
                    trigger OnAction()
                    begin
                        Rec.SetUserDivision(Rec);
                        Rec.CreateNewDocument(Rec, PurchDocType::Order);
                    end;
                }
                action(NewSI)
                {
                    ApplicationArea = All;
                    Image = SalesInvoice;
                    Caption = 'Purchase Invoice';
                    Promoted = true;
                    PromotedCategory = Category6;
                    trigger OnAction()
                    begin
                        Rec.SetUserDivision(Rec);
                        Rec.CreateNewDocument(Rec, PurchDocType::Invoice);
                    end;
                }
                action(NewSCM)
                {
                    ApplicationArea = All;
                    Image = SalesCreditMemo;
                    Caption = 'Purchase Cr. Memo';
                    Promoted = true;
                    PromotedCategory = Category6;
                    trigger OnAction()
                    begin
                        Rec.SetUserDivision(Rec);
                        Rec.CreateNewDocument(Rec, PurchDocType::"Credit Memo");
                    end;
                }
                action(NewRO)
                {
                    ApplicationArea = All;
                    Image = ReturnOrder;
                    Caption = 'Return Order';
                    Promoted = true;
                    PromotedCategory = Category6;
                    trigger OnAction()
                    begin
                        Rec.SetUserDivision(Rec);
                        Rec.CreateNewDocument(Rec, PurchDocType::"Return Order");
                    end;
                }
            }
        }

    }
    var
        PurchDocType: Enum "Purchase Document Type";

}