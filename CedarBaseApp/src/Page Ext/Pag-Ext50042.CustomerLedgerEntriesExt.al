pageextension 50042 "CustomerLedgerEntriesExt" extends "Customer Ledger Entries"
{
    layout
    {
        modify("Customer Name")
        {
            Visible = true;
        }
        //Added By Smdx-Hitesh  
        addafter(Amount)
        {
            field("Customer Blocked status"; Rec."Customer Blocked status")
            {
                ApplicationArea = all;
            }
            field(Comments; Rec.Comments)
            {
                ApplicationArea = all;
            }
            field("Number of Overdue Invoices"; Rec."Number of Overdue Invoices")
            {
                ApplicationArea = ALL;
                Caption = 'Number of Overdue Invoices';
            }

        }
    }
}
