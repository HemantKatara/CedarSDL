page 50107 "Payment Applications"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Detailed Cust. Ledg. Entry";
    SourceTableView = where("Document Type"=const(Payment), "Entry Type"=const(Application), "Initial Document Type"=filter(Invoice));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Payment Amount"; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Payment Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Payment No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Invoice No."; GPIInvNumber)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
    var GPiCustLedgEntry: Record "Cust. Ledger Entry";
    GPIInvNumber: Code[20];
    StartDate1: Date;
    EndDate1: Date;
    trigger OnAfterGetRecord()
    begin
        // Set range on related Customer Ledger Entry
        GPiCustLedgEntry.SetRange("Customer No.", Rec."Customer No.");
        GPiCustLedgEntry.SetRange("Entry No.", Rec."Cust. Ledger Entry No.");
        // Find related entry and get original invoice number
        if GPiCustLedgEntry.FindSet()then GPIInvNumber:=GPiCustLedgEntry."Document No.";
    end;
    // Apply dynamic date filtering on page open
    trigger OnOpenPage()
    begin
        // Calculate the dynamic date range (two years from today)
        StartDate1:=CALCDATE('<-2Y>', WORKDATE);
        EndDate1:=WORKDATE; // Current work date
        // Apply the filter to the Posting Date field dynamically
        Rec.SetRange("Posting Date", StartDate1, EndDate1);
    end;
}
