tableextension 50017 "CustomerLedgerEntryTableExt" extends "Cust. Ledger Entry"
{
    fields
    {
        //Added By Smdx-Hitesh  
        field(50000; "Customer Blocked status"; Enum "Customer Blocked")
        {
            Caption = 'Customer Blocked status';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Blocked where("No." = field("Customer No.")));
        }
        field(50001; "Comments"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Number of Overdue Invoices"; Integer)
        {
            Caption = 'Number of Overdue Invoices';
            DataClassification = ToBeClassified;

        }
    }
}
