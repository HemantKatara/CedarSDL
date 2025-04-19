query 50101 "Combined_Posted_Credit"
{
    elements
    {
    // Top-level data item for Sales Invoice Header
    dataitem(SalesCreditHeader;
    114)
    {
    // Define columns (output fields) from Sales Credit Header
    column("No";
    "No.")
    {
    }
    column("Sell_to_Customer_Name";
    "Sell-to Customer Name")
    {
    }
    column("VAT_Registration_No";
    "VAT Registration No.")
    {
    }
    column("Your_Reference";
    "Your Reference")
    {
    }
    column("Salesperson_Code";
    "Salesperson Code")
    {
    }
    column("Cancelled";
    "Cancelled")
    {
    }
    column("Posting_Date";
    "Posting Date")
    {
    }
    column("Corrective";
    "Corrective")
    {
    }
    column("Shortcut_Dimension_1_Code";
    "Shortcut Dimension 1 Code")
    {
    }
    column("Applies_to_Doc_Type";
    "Applies-to Doc. Type")
    {
    }
    column("Applies_to_Doc_No";
    "Applies-to Doc. No.")
    {
    }
    column("Correction";
    "Correction")
    {
    }
    column("Sell_to_Customer_No";
    "Sell-to Customer No.")
    {
    }
    column("Amount_Including_VAT";
    "Amount Including VAT")
    {
    }
    // Add the Package Tracking No. column but without filtering logic
    column("Package_Tracking_No";
    "Package Tracking No.")
    {
    }
    // Salesperson data item linked to Sales Invoice Header
    dataitem(Salesperson_Purchaser;
    "Salesperson/Purchaser")
    {
    // Link the Salesperson Name to the header using Salesperson No.
    DataItemLink = "Code"=SalesCreditHeader."Salesperson Code"; // Corrected linkage

    // Define columns from Salespeople
    column("Name";
    "Name")
    {
    }
    }
    }
    }
    // Variables declaration
    var StartDate1, EndDate1: Date;
    // Trigger to apply date filtering dynamically
    trigger OnBeforeOpen()
    begin
        // Calculate the dynamic date range (two years from today)
        StartDate1:=CALCDATE('<-2Y>', WORKDATE);
        EndDate1:=WORKDATE; // Current work date
        // Apply the filter to the Posting_Date field ONLY (Package_Tracking_No is not involved here)
        CurrQuery.SETRANGE(CurrQuery.Posting_Date, StartDate1, EndDate1);
    end;
}
