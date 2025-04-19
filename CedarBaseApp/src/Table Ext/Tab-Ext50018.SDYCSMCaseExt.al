tableextension 50018 "SDY CSM Case Ext" extends "SDY CSM Case"
{
    fields
    {
        field(50001; "Amount Paid Total"; Decimal)
        {
            Caption = 'Amount Paid Total';
            Editable = false;
        }
        field(50002; "Amount Ongoing Sales Orders"; Decimal)
        {
            Caption = 'Amount Ongoing Sales Orders';
            Editable = false;
        }
        field(50003; "Amount Unpaid Invoice"; Decimal)
        {
            Caption = 'Amount Unpaid Invoice';
            Editable = false;
        }
        field(50004; Favourite; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Favourite where("No." = field(ReporterCompanyNo)));
            Editable = false;
        }
        field(50005; "Last Paid Date"; Date)
        {
            Caption = 'Last Paid Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50006; "SDY Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(50007; "SDY Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;
            Editable = false;

        }

    }

    var
        Cust: Record Customer;


    procedure GetTotalPaidAmount(Cno: Code[20]): Decimal
    var
        CustLedgEntry: Record "Cust. Ledger Entry";
        Amt: Decimal;
    begin
        CustLedgEntry.Reset();
        CustLedgEntry.SetRange("Customer No.", Cno);
        CustLedgEntry.SetRange("Bal. Account Type", CustLedgEntry."Bal. Account Type"::"Bank Account");
        CustLedgEntry.SetRange(Reversed, false);
        if CustLedgEntry.FindSet() then
            repeat
                CustLedgEntry.CalcFields(Amount);
                Amt += Abs(CustLedgEntry.Amount);
            until CustLedgEntry.Next() = 0;
        exit(Amt);
    end;

    procedure GetLastPaidDate(Cno: Code[20]): Date
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
        Amt: Decimal;
    begin
        CustLedgerEntry.SetCurrentKey("Document Type", "Customer No.", "Posting Date", "Currency Code");
        CustLedgerEntry.SetRange("Customer No.", Cno);
        CustLedgerEntry.SetRange("Document Type", CustLedgerEntry."Document Type"::Payment);
        CustLedgerEntry.SetRange(Reversed, false);
        if CustLedgerEntry.FindLast() then
            exit(CustLedgerEntry."Posting Date");
    end;
}