query 50106 "CLE-Invoices"
{
    elements
    {
    // Top-level data item for Sales Invoice Header
    dataitem(CustLedgEntryINVOICES;
    "Cust. Ledger Entry")
    {
    // Define columns (output fields) from Cust. Ledger Entry
    column("Entry_No_";
    "Entry No.")
    {
    }
    column("Customer_No_";
    "Customer No.")
    {
    }
    column("Global_Dimension_1_Code";
    "Global Dimension 1 Code")
    {
    }
    column("Customer_Name";
    "Customer Name")
    {
    }
    column("Due_Date";
    "Due Date")
    {
    }
    column("Document_Date";
    "Document Date")
    {
    }
    column("Open";
    Open)
    {
    }
    column(Document_Type;
    "Document Type")
    {
    }
    column(Document_No_;
    "Document No.")
    {
    }
    column("Amount";
    "Amount")
    {
    }
    column("Remaining_Amount";
    "Remaining Amount")
    {
    }
    column("Posting_Date";
    "Posting Date")
    {
    }
    column("Salesperson_Code";
    "Salesperson Code")
    {
    }
    // Nested data item for Detailed Cust Ledg Entry
    dataitem(DetailCustLedgEntry;
    "Detailed Cust. Ledg. Entry")
    {
    // Link the line item to the header using Entry No.
    DataItemLink = "Cust. Ledger Entry No."=CustLedgEntryINVOICES."Entry No.";

    // Define columns from Detailed Cust Ledg Entry
    column("Det_Entry_No_";
    "Entry No.")
    {
    }
    column("Entry_Type";
    "Entry Type")
    {
    }
    column(Source_Code;
    "Source Code")
    {
    }
    column(Unapplied;
    Unapplied)
    {
    }
    column(Unapplied_by_Entry_No_;
    "Unapplied by Entry No.")
    {
    }
    column(Cust__Ledger_Entry_No_;
    "Cust. Ledger Entry No.")
    {
    }
    column(Det_Document_Type;
    "Document Type")
    {
    }
    column(Det_Posting_Date;
    "Posting Date")
    {
    }
    column(Det_Document_No_;
    "Document No.")
    {
    }
    column(Det_Amount;
    Amount)
    {
    }
    column(Initial_Entry_Due_Date;
    "Initial Entry Due Date")
    {
    }
    }
    }
    }
    // Variables declaration
    var StartDate, EndDate: Date;
    // Trigger to apply date filtering dynamically
    trigger OnBeforeOpen()
    begin
        // Calculate the dynamic date range (one year from today)
        StartDate:=CALCDATE('<-2Y>', WORKDATE); // One year back
        EndDate:=WORKDATE; // Current work date
        // Apply the filter to the Posting_Date field
        CurrQuery.SETRANGE(CurrQuery.Posting_Date, StartDate, EndDate);
    end;
}
