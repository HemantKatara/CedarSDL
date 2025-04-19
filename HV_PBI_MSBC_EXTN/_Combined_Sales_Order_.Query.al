query 50102 "Combined_Sales_Order"
{
    elements
    {
    // Top-level data item for Sales Order Header
    dataitem(SalesOrderHeader;
    36)
    {
    // Apply document type filters within the dataitem
    DataItemTableFilter = "Document Type"=filter("Order");

    // Define columns (output fields) from Sales Order Header
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
    column("Posting_Date";
    "Posting Date")
    {
    }
    column("Salesperson_Code";
    "Salesperson Code")
    {
    }
    column("Document_Date";
    "Document Date")
    {
    }
    column("Order_Date";
    "Order Date")
    {
    }
    column("Status";
    "Status")
    {
    }
    // Include the Package Tracking No. field, but no additional logic or filtering will be applied to this field
    column("Package_Tracking_No";
    "Package Tracking No.")
    {
    } // This is retained for now but marked for removal in the future
    column("Completely_Shipped";
    "Completely Shipped")
    {
    }
    // Sales Line data item linked to Sales Order Header
    dataitem(Sales_Line;
    "Sales Line")
    {
    // Link the Sales Lines to the header using Document No.
    DataItemLink = "Document No."=SalesOrderHeader."No."; // Corrected linkage

    // Define columns from Sales Line
    column("Document_No";
    "Document No.")
    {
    }
    column("Line_No";
    "Line No.")
    {
    }
    column("Type";
    "Type")
    {
    }
    column("Gen_Bus_Posting_Group";
    "Gen. Bus. Posting Group")
    {
    }
    column("Gen_Prod_Posting_Group";
    "Gen. Prod. Posting Group")
    {
    }
    column("VAT_Bus_Posting_Group";
    "VAT Bus. Posting Group")
    {
    }
    column("Line_Amount";
    "Line Amount")
    {
    }
    column("Qty_to_Ship";
    "Qty. to Ship")
    {
    }
    column("Quantity_Shipped";
    "Quantity Shipped")
    {
    }
    column("Qty_to_Invoice";
    "Qty. to Invoice")
    {
    }
    column("Quantity_Invoiced";
    "Quantity Invoiced")
    {
    }
    column("Shipment_Date";
    "Shipment Date")
    {
    }
    column("Blanket_Order_No";
    "Blanket Order No.")
    {
    }
    column("Blanket_Order_Line_No";
    "Blanket Order Line No.")
    {
    }
    }
    }
    }
    // Variables declaration
    var StartDate2, EndDate2: Date;
    // Trigger to apply date filtering dynamically
    trigger OnBeforeOpen()
    begin
        // Calculate the dynamic date range (two years from today)
        StartDate2:=CALCDATE('<-2Y>', WORKDATE);
        EndDate2:=WORKDATE; // Current work date
        // Apply the filter to the Order_Date field ONLY (Package_Tracking_No is not involved here)
        CurrQuery.SETRANGE(CurrQuery.Order_Date, StartDate2, EndDate2);
    // No filtering or logic is applied to Package_Tracking_No, so it won't interfere with the date filtering
    end;
}
