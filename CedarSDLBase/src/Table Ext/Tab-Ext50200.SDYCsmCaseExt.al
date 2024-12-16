tableextension 50200 "SDYCsmCaseExt" extends "SDY CSM Case"
{
    fields
    {
        field(50200; "Customer Blocked status"; enum "Customer Blocked")
        {
            Caption = 'Customer Blocked status';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Blocked where("No." = field(ReporterCompanyNo)));
        }
        field(50201; "Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50202; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer."Salesperson Code" where("No." = field(ReporterCompanyNo)));
        }
        field(50203; "Salesperson Name"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Salesperson/Purchaser".Name where(Code = field("Salesperson Code")));
        }
        field(50204; "Customer No"; Code[20])
        {
            Caption = 'Customer No';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer."No." where("No." = field(ReporterCompanyNo)));


        }
        field(50205; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field(ReporterCompanyNo)));
        }
    }
}
