pageextension 50201 "SdyCsmCaseActionLPExt" extends "SDY CSM Case Action LP"
{
    actions
    {
        // Add changes to page actions here
        addafter("Posted Sales Invoice")
        {
            action(CustomerComment)
            {
                ApplicationArea = All;
                Image = Comment;
                Caption = 'Comments';

                trigger OnAction()
                var
                    ContBusRel: Record "Contact Business Relation";
                    RecContact: Record Contact;
                    RecCase: Record "SDY CSM Case";
                    CommentLine: Record "Comment Line";
                begin
                    RecCase.Get(Rec."Case No.");
                    RecCase.TestField(ReporterNo);
                    RecContact.get(RecCase.ReporterNo);
                    ContBusRel.reset;
                    ContBusRel.SETCURRENTKEY("Link to Table", "No.");
                    ContBusRel.SETRANGE("Link to Table", ContBusRel."Link to Table"::Customer);
                    ContBusRel.SETRANGE("Contact No.", RecContact."Company No.");
                    if ContBusRel.FindFirst() then Begin
                        CommentLine.Reset();
                        CommentLine.SetRange("Table Name", CommentLine."Table Name"::Customer);
                        CommentLine.SetRange("No.", ContBusRel."No.");
                        Page.RunModal(Page::"Comment Sheet", CommentLine);
                    End;
                End;
            }
        }
        modify(Custom)
        {
            CaptionML = ENU = 'Posted Sales Shipment', ENG = 'Posted Sales Shipment';
        }
        modify("Posted Sales Credit Memo")
        {
            Visible = false;
        }
        modify("Posted Purchase Credit Memo")
        {
            Visible = false;
        }
        modify("Posted Purchase Invoice")
        {
            Visible = false;
        }
        modify("Unposted Purchase Documents")
        {
            Visible = false;
        }
        modify(Vendor)
        {
            Visible = false;
        }
        modify(Customer)
        {
            Visible = false;
        }
        modify(Item)
        {
            Visible = false;
        }
    }
    var
        myInt: Integer;
}
