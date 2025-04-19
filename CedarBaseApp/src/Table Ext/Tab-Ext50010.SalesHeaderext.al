tableextension 50010 "Sales Header ext" extends "Sales Header"
{
    fields
    {
        // Add changes to table fields here
        field(50001; Completed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Cancelled"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        // added by smdx-hitesh
        field(50003; "Blanket Sales Order Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        // added by smdx-hitesh
        field(50004; "Customer Blocked status"; Enum "Customer Blocked")
        {
            Caption = 'Customer Blocked status';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Blocked where("No." = field("Sell-to Customer No.")));
        }
        field(50005; "BSO Order Comments"; Text[2048])
        {
            Caption = 'BSO Order Comments';
            DataClassification = ToBeClassified;

        }
    }

    var
        myInt: Integer;
}