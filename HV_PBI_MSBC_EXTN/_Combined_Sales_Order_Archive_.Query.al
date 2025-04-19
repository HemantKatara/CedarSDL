query 50103 "Combined_Sales_Order_Archive"
{
    elements
    {
    // Top-level data item for Sales Order Archive Header
    dataitem(SalesOrderArchiveHeader;
    5107)
    {
    // Apply document type filters within the dataitem
    DataItemTableFilter = "Document Type"=filter("Order");

    // Define columns (output fields) from Sales Order Archive Header
    column("No_";
    "No.")
    {
    }
    column("Version_No";
    "Version No.")
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
    column("Document_Date";
    "Document Date")
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
    // Include the Package Tracking No. field, but no additional logic or filtering will be applied to this field
    column("Package_Tracking_No";
    "Package Tracking No.")
    {
    } // This is retained for now but marked for removal in the future
    column("Date_Archived";
    "Date Archived")
    {
    }
    // Sales Line Archive data item linked to Sales Order Archive Header
    dataitem(Sales_Line_Archive;
    "Sales Line Archive")
    {
    // Link the Sales Order Archive Line to the header using Document No.
    DataItemLink = "Document No."=SalesOrderArchiveHeader."No."; // Corrected linkage

    // Define columns from Sales Line
    column("Line_No";
    "Line No.")
    {
    }
    column("Type";
    "Type")
    {
    }
    column("No";
    "No.")
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
    column("VAT_Prod_Posting_Group";
    "VAT Prod. Posting Group")
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
    column("Shortcut_Dimension_1_Code";
    "Shortcut Dimension 1 Code")
    {
    }
    }
    }
    }
    // Variables declaration
    var StartDate3, EndDate3: Date;
    // Trigger to apply date filtering dynamically
    trigger OnBeforeOpen()
    begin
        // Calculate the dynamic date range (two years from today)
        StartDate3:=CALCDATE('<-2Y>', WORKDATE);
        EndDate3:=WORKDATE; // Current work date
        // Apply the filter to the Order_Date field ONLY (Package_Tracking_No is not involved here)
        CurrQuery.SETRANGE(CurrQuery.Order_Date, StartDate3, EndDate3);
    end;
}
