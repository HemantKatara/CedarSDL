report 50014 "UpdateOverDueEntryBatch"
{
    ApplicationArea = All;
    Caption = 'Update Over Due Invoices Batch ';
    UsageCategory = Administration;
    ProcessingOnly = true;
    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.";

            trigger OnPreDataItem()
            var
            BEGIN

            END;

            trigger OnAfterGetRecord()
            var
            BEGIN
                NoOfPSICount := 0;
                CustLedgerEntry.RESET;
                CustLedgerEntry.SETRANGE("Customer No.", Customer."No.");
                CustLedgerEntry.SETRANGE("Document Type", CustLedgerEntry."Document Type"::Invoice);
                CustLedgerEntry.SETFILTER("Due Date", '<=%1', TODAY);
                CustLedgerEntry.SETRANGE(Open, TRUE);
                IF CustLedgerEntry.FINDSET THEN BEGIN
                    REPEAT
                        NoOfPSICount += 1;
                    UNTIL CustLedgerEntry.NEXT = 0;
                END;

                CustLedgerEntry2.RESET;
                CustLedgerEntry2.SETRANGE("Customer No.", Customer."No.");
                IF CustLedgerEntry2.FINDSET THEN BEGIN
                    REPEAT
                        CustLedgerEntry2."Number of Overdue Invoices" := NoOfPSICount;
                        CustLedgerEntry2.MODIFY;
                    UNTIL CustLedgerEntry2.NEXT = 0;
                END;

            END;

        }

    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
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
        NoOfPSICount: Integer;
        CustLedgerEntry: Record "Cust. Ledger Entry";
        CustLedgerEntry2: Record "Cust. Ledger Entry";
}
