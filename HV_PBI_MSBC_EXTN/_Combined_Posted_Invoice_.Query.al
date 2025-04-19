query 50100 "Combined_Posted_Invoice"
{
    elements
    {
    // Top-level data item for Sales Invoice Header
    dataitem(SalesInvoiceHeader;
    "Sales Invoice Header")
    {
    // Define columns (output fields) from Sales Invoice Header
    column("No";
    "No.")
    {
    }
    column("Order_No";
    "Order No.")
    {
    }
    column("Sell_to_Customer_No";
    "Sell-to Customer No.")
    {
    }
    column("Shortcut_Dimension_1_Code";
    "Shortcut Dimension 1 Code")
    {
    }
    column("Sell_to_Customer_Name";
    "Sell-to Customer Name")
    {
    }
    column("Due_Date";
    "Due Date")
    {
    }
    column("Amount";
    "Amount")
    {
    }
    column("Amount_Including_VAT";
    "Amount Including VAT")
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
    column("Closed";
    "Closed")
    {
    }
    column("Cancelled";
    "Cancelled")
    {
    }
    // Nested data item for Sales Invoice Line
    dataitem(SalesInvoiceLine;
    "Sales Invoice Line")
    {
    // Link the line item to the header using Document No.
    DataItemLink = "Document No."=SalesInvoiceHeader."No.";
    // Apply Type filters within the dataitem
    DataItemTableFilter = "Type"=const(Item);

    // Define columns from Sales Invoice Line
    column("Document_No";
    "Document No.")
    {
    }
    column("Line_No";
    "Line No.")
    {
    }
    column("Line_Amount";
    "Amount")
    {
    }
    column("Line_Amount_Including_VAT";
    "Amount Including VAT")
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
