report 50201 "Modify/Insert Data"
{
    Permissions = tabledata "Cust. Ledger Entry"=rim;
    UsageCategory = Administration;
    ApplicationArea = All;

    dataset
    {
    }
    trigger OnPreReport()
    var
        CustomerLedgerEntry: Record "Cust. Ledger Entry";
    begin
        if not CustomerLedgerEntry.get(0)then begin
            CustomerLedgerEntry.Init();
            CustomerLedgerEntry."Entry No.":=0;
            CustomerLedgerEntry.Insert();
        end;
    end;
    var myInt: Integer;
}
