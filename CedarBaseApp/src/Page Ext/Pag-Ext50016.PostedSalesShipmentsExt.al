pageextension 50016 "Posted Sales Shipments Ext" extends "Posted Sales Shipments"
{
    ContextSensitiveHelpPage = 'ui-post-sales';
    layout
    {
        // Add changes to page layout here
        addafter("Document Date")
        {
            field("Order No."; Rec."Order No.")
            {
                ApplicationArea = all;
            }
        }
        modify("Posting Date")
        {
            Visible = true;
        }
    }

    actions
    {
        // Add changes to page actions here
        addafter("&Print")
        {
            // action(SendCustom)
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Send';
            //     Ellipsis = true;
            //     Image = SendToMultiple;
            //     Promoted = true;
            //     PromotedCategory = Category6;
            //     PromotedIsBig = true;
            //     ToolTip = 'Prepare to send the document according to the customer''s sending profile, such as attached to an email. The Send document to window opens first so you can confirm or select a sending profile.';

            //     trigger OnAction()
            //     var
            //         SalesInvHeader: Record "Sales Shipment Header";
            //     begin
            //         SalesInvHeader := Rec;
            //         CurrPage.SetSelectionFilter(SalesInvHeader);
            //         SalesInvHeader.SendRecords;
            //     end;
            // }

            action(Email)
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Email';
                Image = Email;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Prepare to email the document. The Send Email window opens prefilled with the customer''s email address so you can add or edit information.';

                trigger OnAction()
                begin
                    SalesInvHeader := Rec;
                    CurrPage.SetSelectionFilter(SalesInvHeader);
                    SalesInvHeader.EmailRecords(true);
                end;
            }
            // action(AttachAsPDF)
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Attach as PDF';
            //     Image = PrintAttachment;
            //     Promoted = true;
            //     PromotedCategory = Category6;
            //     ToolTip = 'Create a PDF file and attach it to the document.';

            //     trigger OnAction()
            //     var
            //         SalesInvoiceHeader: Record "Sales Shipment Header";
            //     begin
            //         SalesInvoiceHeader := Rec;
            //         SalesInvoiceHeader.SetRecFilter();
            //         PrintToDocumentAttachment(SalesInvoiceHeader);
            //     end;
            // }
        }
    }

    var
        myInt: Integer;
        SalesInvHeader: Record "Sales Shipment Header";
}