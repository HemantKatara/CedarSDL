report 50015 "UpdateCustomerNameBatch"
{
    ApplicationArea = All;
    Caption = 'Update Customer Name Batch';
    UsageCategory = Administration;
    ProcessingOnly = true;
    dataset
    {
        dataitem(CustLedgerEntry; "Cust. Ledger Entry")
        {

            trigger OnPreDataItem()
            var
            BEGIN

            END;

            trigger OnAfterGetRecord()
            var
            BEGIN
                Cust.get(CustLedgerEntry."Customer No.");

                if not Replace then begin
                    if "Customer Name" = '' then
                        CustLedgerEntry.Validate("Customer Name", Cust.Name);
                end else
                    CustLedgerEntry.Validate("Customer Name", Cust.Name);

                CustLedgerEntry.Modify();
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Genral)
                {
                    field(Replace; Replace)
                    {
                        ApplicationArea = all;
                        Caption = 'Replace';
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        CustLedgerEntry2: Record "Cust. Ledger Entry";
        Cust: Record Customer;
        Replace: Boolean;
}
