pageextension 50055 "Cash Receipt Journal Ext" extends "Cash Receipt Journal"
{
    layout
    {
        modify("Account No.")
        {
            trigger OnLookup(var Text: Text): Boolean
            var
                Cust: Record Customer;
                Vend: Record Vendor;
                GLAccount: Record "G/L Account";
                BankAccount: Record "Bank Account";
                GenJrnalBatch: Record "Gen. Journal Batch";
            begin
                GenJrnalBatch.Get(rec."Journal Template Name", Rec."Journal Batch Name");
                case Rec."Account Type" of
                    Rec."Account Type"::Customer:
                        begin
                            if GenJrnalBatch."Skip Division Check" then begin
                                Cust.Reset();
                                if Cust.FindSet() then
                                    IF PAGE.RUNMODAL(PAGE::"Customer List", Cust) = ACTION::LookupOK THEN
                                        Rec."Account No." := Cust."No.";
                            end else begin
                                Cust.Reset();
                                if Cust.FindSet() then
                                    repeat
                                        Cust.Mark := CheckDivision(18, Cust."No.", GenJrnalBatch."Division Code")
                                    until Cust.Next = 0;
                                Cust.MarkedOnly(true);
                                IF PAGE.RUNMODAL(PAGE::"Customer List", Cust) = ACTION::LookupOK THEN
                                    Rec."Account No." := Cust."No.";

                                Cust.ClearMarks();
                            end;
                        end;

                    Rec."Account Type"::Vendor:
                        begin
                            if GenJrnalBatch."Skip Division Check" then begin
                                Vend.Reset();
                                if Vend.FindSet() then
                                    IF PAGE.RUNMODAL(PAGE::"Vendor List", Vend) = ACTION::LookupOK THEN
                                        Rec."Account No." := Vend."No.";
                            end else begin
                                Vend.Reset();
                                if Vend.FindSet() then
                                    repeat
                                        Vend.Mark := CheckDivision(23, Vend."No.", GenJrnalBatch."Division Code");
                                    until Vend.Next = 0;
                                Vend.MarkedOnly(true);
                                IF PAGE.RUNMODAL(PAGE::"Vendor List", Vend) = ACTION::LookupOK THEN
                                    Rec."Account No." := Vend."No.";

                                Vend.ClearMarks();
                            end;
                        end;
                    Rec."Account Type"::"G/L Account":
                        begin
                            if GenJrnalBatch."Skip Division Check" then begin
                                GLAccount.Reset();
                                if GLAccount.FindSet() then
                                    IF PAGE.RUNMODAL(PAGE::"G/L Account List", GLAccount) = ACTION::LookupOK THEN
                                        Rec."Account No." := GLAccount."No.";
                            end else begin
                                GLAccount.Reset();
                                if GLAccount.FindSet() then
                                    repeat
                                        GLAccount.Mark := CheckDivision(15, GLAccount."No.", GenJrnalBatch."Division Code");
                                    until GLAccount.Next = 0;
                                GLAccount.MarkedOnly(true);
                                IF PAGE.RUNMODAL(PAGE::"G/L Account List", GLAccount) = ACTION::LookupOK THEN
                                    Rec."Account No." := GLAccount."No.";

                                GLAccount.ClearMarks();
                            end;
                        end;
                    Rec."Account Type"::"Bank Account":
                        begin
                            if GenJrnalBatch."Skip Division Check" then begin
                                BankAccount.Reset();
                                if BankAccount.FindSet() then
                                    IF PAGE.RUNMODAL(PAGE::"Bank Account List", BankAccount) = ACTION::LookupOK THEN
                                        Rec."Account No." := BankAccount."No."
                            end else begin
                                BankAccount.Reset();
                                if BankAccount.FindSet() then
                                    repeat
                                        BankAccount.Mark := CheckDivision(270, BankAccount."No.", GenJrnalBatch."Division Code");
                                    until BankAccount.Next = 0;
                                BankAccount.MarkedOnly(true);
                                IF PAGE.RUNMODAL(PAGE::"Bank Account List", BankAccount) = ACTION::LookupOK THEN
                                    Rec."Account No." := BankAccount."No.";
                                BankAccount.ClearMarks();
                            end;
                        end;
                end;
            end;
        }

        modify("Bal. Account No.")
        {
            trigger OnLookup(var Text: Text): Boolean
            var
                Cust: Record Customer;
                Vend: Record Vendor;
                GLAccount: Record "G/L Account";
                BankAccount: Record "Bank Account";
                GenJrnalBatch: Record "Gen. Journal Batch";
            begin
                GenJrnalBatch.Get(rec."Journal Template Name", Rec."Journal Batch Name");
                case Rec."Bal. Account Type" of
                    Rec."Bal. Account Type"::Customer:
                        begin
                            if GenJrnalBatch."Skip Division Check" then begin
                                Cust.Reset();
                                if Cust.FindSet() then
                                    IF PAGE.RUNMODAL(PAGE::"Customer List", Cust) = ACTION::LookupOK THEN
                                        Rec."Bal. Account No." := Cust."No.";
                            end else begin
                                Cust.Reset();
                                if Cust.FindSet() then
                                    repeat
                                        Cust.Mark := CheckDivision(18, Cust."No.", GenJrnalBatch."Division Code")
                                    until Cust.Next = 0;
                                Cust.MarkedOnly(true);
                                IF PAGE.RUNMODAL(PAGE::"Customer List", Cust) = ACTION::LookupOK THEN
                                    Rec."Bal. Account No." := Cust."No.";

                                Cust.ClearMarks();
                            end;
                        end;

                    Rec."Bal. Account Type"::Vendor:
                        begin
                            if GenJrnalBatch."Skip Division Check" then begin
                                Vend.Reset();
                                if Vend.FindSet() then
                                    IF PAGE.RUNMODAL(PAGE::"Vendor List", Vend) = ACTION::LookupOK THEN
                                        Rec."Bal. Account No." := Vend."No.";
                            end else begin
                                Vend.Reset();
                                if Vend.FindSet() then
                                    repeat
                                        Vend.Mark := CheckDivision(23, Vend."No.", GenJrnalBatch."Division Code");
                                    until Vend.Next = 0;
                                Vend.MarkedOnly(true);
                                IF PAGE.RUNMODAL(PAGE::"Vendor List", Vend) = ACTION::LookupOK THEN
                                    Rec."Bal. Account No." := Vend."No.";

                                Vend.ClearMarks();
                            end;
                        end;

                    Rec."Bal. Account Type"::"G/L Account":
                        begin
                            if GenJrnalBatch."Skip Division Check" then begin
                                GLAccount.Reset();
                                if GLAccount.FindSet() then
                                    IF PAGE.RUNMODAL(PAGE::"G/L Account List", GLAccount) = ACTION::LookupOK THEN
                                        Rec."Bal. Account No." := GLAccount."No.";
                            end else begin
                                GLAccount.Reset();
                                if GLAccount.FindSet() then
                                    repeat
                                        GLAccount.Mark := CheckDivision(15, GLAccount."No.", GenJrnalBatch."Division Code");
                                    until GLAccount.Next = 0;
                                GLAccount.MarkedOnly(true);
                                IF PAGE.RUNMODAL(PAGE::"G/L Account List", GLAccount) = ACTION::LookupOK THEN
                                    Rec."Bal. Account No." := GLAccount."No.";

                                GLAccount.ClearMarks();
                            end;
                        end;

                    Rec."Bal. Account Type"::"Bank Account":
                        begin
                            if GenJrnalBatch."Skip Division Check" then begin
                                BankAccount.Reset();
                                if BankAccount.FindSet() then
                                    IF PAGE.RUNMODAL(PAGE::"Bank Account List", BankAccount) = ACTION::LookupOK THEN
                                        Rec."Bal. Account No." := BankAccount."No.";
                            end else begin
                                BankAccount.Reset();
                                if BankAccount.FindSet() then
                                    repeat
                                        BankAccount.Mark := CheckDivision(270, BankAccount."No.", GenJrnalBatch."Division Code");
                                    until BankAccount.Next = 0;
                                BankAccount.MarkedOnly(true);
                                IF PAGE.RUNMODAL(PAGE::"Bank Account List", BankAccount) = ACTION::LookupOK THEN
                                    Rec."Bal. Account No." := BankAccount."No.";
                                BankAccount.ClearMarks();
                            end;
                        end;
                end;
            end;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;

    local procedure CheckDivision(TableNo: Integer; No: Code[20]; BatchCode: code[20]): Boolean
    var
        DefaultDimension: Record "Default Dimension";
        GLSetup: Record "General Ledger Setup";
        DimValue: Record "Dimension Value";
        RecFound: Boolean;
    begin
        GLSetup.Get;
        if Not DefaultDimension.Get(TableNo, No, GLSetup."Global Dimension 1 Code") then
            exit(false);

        if DefaultDimension."Allowed Values Filter" <> '' then begin
            DimValue.Reset();
            DimValue.SetRange("Dimension Code", DefaultDimension."Dimension Code");
            DimValue.SetFilter(Code, DefaultDimension."Allowed Values Filter");
            if DimValue.FindSet() then
                repeat
                    if BatchCode = DimValue.Code then
                        RecFound := true;
                until DimValue.Next() = 0;

            if RecFound then
                exit(true);

        end else
            if DefaultDimension."Dimension Value Code" <> '' then begin
                if DefaultDimension."Dimension Value Code" = BatchCode then
                    exit(true);
            end else
                exit(true);
    end;
}