query 50104 "Combined_Blanket_Sales_Order"
{
    elements
    {
    // Top-level data item for Blanket Sales Order Header
    dataitem(SalesOrderHeader;
    36)
    {
    // Apply document type filters within the dataitem
    DataItemTableFilter = "Document Type"=filter("Blanket Order");

    // Define columns (output fields) from Blanket Sales Header
    column("No";
    "No.")
    {
    }
    column("Sell_to_Customer_No";
    "Sell-to Customer No.")
    {
    }
    column("Sell_to_Customer_Name";
    "Sell-to Customer Name")
    {
    }
    column("Order_Date";
    "Order Date")
    {
    }
    column("Salesperson_Code";
    "Salesperson Code")
    {
    }
    column("Status";
    "Status")
    {
    }
    dataitem(Sales_Line;
    "Sales Line")
    {
    // Link the Salesperson Name to the header using Salesperson No.
    DataItemLink = "Document No."=SalesOrderHeader."No."; // Corrected linkage
    DataItemTableFilter = "No."=filter('<>"GLPL-10110"');

    // Define columns from Sales Line
    column("Line_No";
    "Line No.")
    {
    }
    column("Quantity";
    "Quantity")
    {
    }
    column("Unit_Price";
    "Unit Price")
    {
    }
    column("Line_Amount";
    "Line Amount")
    {
    }
    column("Shortcut_Dimension_1_Code";
    "Shortcut Dimension 1 Code")
    {
    }
    }
    }
    }
    // Variables declaration
    var StartDate4, EndDate4: Date;
    // Trigger to apply date filtering dynamically
    trigger OnBeforeOpen()
    begin
        // Calculate the dynamic date range (one year from today)
        StartDate4:=CALCDATE('<-2Y>', WORKDATE); // One year back
        EndDate4:=WORKDATE; // Current work date
        // Apply the filter to the Posting_Date field
        CurrQuery.SETRANGE(CurrQuery.Order_Date, StartDate4, EndDate4);
    end;
}
