pageextension 50009 "Blanket Sales Order Ext" extends "Blanket Sales Order"
{
    ContextSensitiveHelpPage = 'sales-how-to-create-blanket-sales-orders';

    layout
    {
        // Add changes to page layout here
        addafter("Assigned User ID")
        {
            field(Cancelled; Rec.Cancelled)
            {
                ApplicationArea = all;
                Editable = false;
                Caption = 'Cancelled';
            }
        }

        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }

    }


    actions
    {
        // Add changes to page actions here
        modify(MakeOrder)
        {
            trigger OnBeforeAction()
            begin
                Rec.TestField(Cancelled, false);
            end;
        }
        addbefore(AttachAsPDF)
        {
            action(SendEmailConfirmation)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send By Email';
                Ellipsis = true;
                Image = Email;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                ToolTip = 'Send a Balnket sales order confirmation by email. The attachment is sent as a .pdf.';

                trigger OnAction()
                begin
                    DocPrint.EmailSalesHeader(Rec);
                end;
            }
            action(CancelBSO)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cancel BSO';
                Ellipsis = true;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Cancel Blanket Sales Order';

                trigger OnAction()
                begin
                    if not Confirm('Do you want to cancel BSO No. %1', false, Rec."No.") then
                        exit;
                    UserSetup.Get(UserId);
                    if UserSetup."Allow Cancel BSO" = true then
                        Rec.Cancelled := true
                    else
                        Error('You do not have permission to Cancel BSO');
                end;
            }
        }

    }

    trigger OnInsertRecord(BelowXrec: Boolean): Boolean
    begin
        Error('Create Blanket Sales Order Document from Customer');
    end;

    var
        DocPrint: Codeunit "Document-Print";
        UserSetup: Record "User Setup";
}