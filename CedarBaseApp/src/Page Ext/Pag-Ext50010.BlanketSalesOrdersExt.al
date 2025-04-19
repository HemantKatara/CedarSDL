pageextension 50010 "Blanket Sales Orders Ext" extends "Blanket Sales Orders"
{
    ContextSensitiveHelpPage = 'sales-how-to-create-blanket-sales-orders';
    layout
    {
        // Add changes to page layout here
        addafter("Location Code")
        {

            field("Order Date"; Rec."Order Date")
            {
                Caption = 'Order Date';
                ApplicationArea = all;
            }
            field("BSO Order Comments"; Rec."BSO Order Comments")
            {
                Caption = 'BSO Order Comments';
                ApplicationArea = all;

            }

        }
    }
    actions
    {
        // Add changes to page actions here

        addbefore(AttachAsPDF)
        {

            action(SendEmailConfirmation)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send By Email';
                Ellipsis = true;
                Image = Email;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Send a Balnket sales order confirmation by email. The attachment is sent as a .pdf.';

                trigger OnAction()
                begin
                    DocPrint.EmailSalesHeader(Rec);
                end;
            }

        }

    }

    var
        DocPrint: Codeunit "Document-Print";
        UserSetup: Record "User Setup";
        IsHandled: Boolean;
        SalesHeader: Record "Sales Header";

    trigger OnOpenPage()
    begin
        IF IsHandled then
            Rec.CopyFilters(SalesHeader)
        else begin
            UserSetup.Get(UserId);
            if UserSetup."Allow View All BSO" = false then begin
                Rec.setrange(Completed, false);
                Rec.SetRange(Cancelled, false);
            end;
        end;
    end;

    trigger OnAfterGetRecord()
    var
        SalesCommentLine: Record "Sales Comment Line";
    begin
        SalesCommentLine.Reset();
        SalesCommentLine.SetRange("Document Type", Rec."Document Type");
        SalesCommentLine.SetRange("No.", Rec."No.");
        if SalesCommentLine.FindLast() then
            Rec."BSO Order Comments" := SalesCommentLine.Comment;

    end;

    procedure SetFilter(Skip: Boolean; var SH: Record "Sales Header")
    begin
        IsHandled := Skip;
        SalesHeader.CopyFilters(SH);
    end;

}