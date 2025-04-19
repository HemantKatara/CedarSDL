report 50003 "Email Signature"
{
    ApplicationArea = All;
    Caption = 'Email Signature';
    UsageCategory = Administration;
    DefaultLayout = Word;
    WordLayout = './layout/EmailSignature.docx';
    dataset
    {
        dataitem(Customer; Customer)
        {
            trigger OnPreDataItem()
            begin
                IF GETFILTER("No.") = '' THEN
                    CurrReport.BREAK;
            end;

            trigger OnAfterGetRecord()
            var
                GenLedgerSetup: Record "General Ledger Setup";
            begin
                BodyText2 := StrSubstNo(BodyTextOrderConf2, DivisionRec.Address);
                BodyText3 := BodyTextOrderConf3;
                BodyText4 := BodyTextOrderConf4;

                GenLedgerSetup.Get();
                if DivisionRec.Get(Customer."Global Dimension 1 Code") then
                    DivisionRec.CalcFields(Picture);
            end;
        }
        dataitem("Sales Header"; "Sales Header")
        {
            trigger OnPreDataItem()
            begin
                IF GETFILTER("No.") = '' THEN
                    CurrReport.BREAK;
            end;

            trigger OnAfterGetRecord()
            var
                DimSetId: Record "Dimension Set Entry";
                GenLedgerSetup: Record "General Ledger Setup";
            begin
                IF "Sales Header"."Document Type" = "Sales Header"."Document Type"::Order THEN BEGIN
                    BodyText2 := StrSubstNo(BodyTextOrderConf2, DivisionRec.Address);
                    BodyText3 := BodyTextOrderConf3;
                    BodyText4 := BodyTextOrderConf4;
                end;
                GenLedgerSetup.Get();
                DimSetId.Reset();
                DimSetId.SetRange("Dimension Set ID", "Sales Header"."Dimension Set ID");
                DimSetId.SetFilter("Dimension Code", GenLedgerSetup."Global Dimension 1 Code");
                if DimSetId.FindFirst() then begin
                    if DivisionRec.Get(DimSetId."Dimension Value Code") then
                        DivisionRec.CalcFields(Picture);

                end;
            end;
        }


        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            trigger OnPreDataItem()
            begin
                IF GETFILTER("No.") = '' THEN
                    CurrReport.BREAK;
            end;

            trigger OnAfterGetRecord()
            var
                DimSetId: Record "Dimension Set Entry";
                GenLedgerSetup: Record "General Ledger Setup";
            begin
                BodyText2 := StrSubstNo(BodyTextSalesInv, DivisionRec.Address);
                BodyText3 := BodyTextSalesInv2;
                BodyText4 := BodyTextSalesInv3;

                GenLedgerSetup.Get();
                DimSetId.Reset();
                DimSetId.SetRange("Dimension Set ID", "Sales Invoice Header"."Dimension Set ID");
                DimSetId.SetFilter("Dimension Code", GenLedgerSetup."Global Dimension 1 Code");
                if DimSetId.FindFirst() then begin
                    if DivisionRec.Get(DimSetId."Dimension Value Code") then
                        DivisionRec.CalcFields(Picture);



                end;
            end;
        }
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            trigger OnPreDataItem()
            begin
                IF GETFILTER("No.") = '' THEN
                    CurrReport.BREAK;
            end;

            trigger OnAfterGetRecord()
            var
                DimSetId: Record "Dimension Set Entry";
                GenLedgerSetup: Record "General Ledger Setup";
            begin
                BodyText2 := StrSubstNo(BodyTextSalesInv, DivisionRec.Address);
                BodyText3 := BodyTextSalesInv2;
                BodyText4 := BodyTextSalesInv3;

                GenLedgerSetup.Get();
                DimSetId.Reset();
                DimSetId.SetRange("Dimension Set ID", "Sales Shipment Header"."Dimension Set ID");
                DimSetId.SetFilter("Dimension Code", GenLedgerSetup."Global Dimension 1 Code");
                if DimSetId.FindFirst() then begin
                    if DivisionRec.Get(DimSetId."Dimension Value Code") then
                        DivisionRec.CalcFields(Picture);
                end;
            end;
        }
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            trigger OnPreDataItem()
            begin
                IF GETFILTER("No.") = '' THEN
                    CurrReport.BREAK;
            end;

            trigger OnAfterGetRecord()
            var
                DimSetId: Record "Dimension Set Entry";
                GenLedgerSetup: Record "General Ledger Setup";
            begin
                BodyText2 := StrSubstNo(BodyTextSalesInv, DivisionRec.Address);
                BodyText3 := BodyTextSalesInv2;
                BodyText4 := BodyTextSalesInv3;

                GenLedgerSetup.Get();
                DimSetId.Reset();
                DimSetId.SetRange("Dimension Set ID", "Sales Cr.Memo Header"."Dimension Set ID");
                DimSetId.SetFilter("Dimension Code", GenLedgerSetup."Global Dimension 1 Code");
                if DimSetId.FindFirst() then begin
                    if DivisionRec.Get(DimSetId."Dimension Value Code") then
                        DivisionRec.CalcFields(Picture);
                end;
            end;
        }


        dataitem("Purchase Header"; "Purchase Header")
        {
            trigger OnPreDataItem()
            begin
                IF GETFILTER("No.") = '' THEN
                    CurrReport.BREAK;
            end;

            trigger OnAfterGetRecord()
            var
                DimSetId: Record "Dimension Set Entry";
                GenLedgerSetup: Record "General Ledger Setup";
            begin
                BodyText2 := StrSubstNo(BodyTextSalesInv, DivisionRec.Address);
                BodyText3 := BodyTextSalesInv2;
                BodyText4 := BodyTextSalesInv3;

                GenLedgerSetup.Get();
                DimSetId.Reset();
                DimSetId.SetRange("Dimension Set ID", "Purchase Header"."Dimension Set ID");
                DimSetId.SetFilter("Dimension Code", GenLedgerSetup."Global Dimension 1 Code");
                if DimSetId.FindFirst() then begin
                    if DivisionRec.Get(DimSetId."Dimension Value Code") then
                        DivisionRec.CalcFields(Picture);
                end;
            end;


        }
        dataitem(Integer; Integer)
        {
            DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
            column(TemporaryPicture; DivisionRec.Picture)
            {

            }
            column(BodyText1; BodyText1)
            {

            }
            column(BodyText2; BodyText2)
            {

            }
            column(BodyText3; BodyText3)
            {

            }
            column(BodyText4; BodyText4)
            {

            }
            column(BodyText5; BodyText5)
            {

            }
            column(DivisionName; DivisionRec.Name)
            {

            }
            column(DiviSionAdd1; DivisionRec.Address)
            {

            }
            column(DivisionAdd2; DivisionRec."Address 2")
            {

            }
            column(DivisionCity; DivisionRec.City)
            {
            }
            column(DivisionPostCode; DivisionRec."Post Code")
            {
            }
            column(DivisionEmail; DivisionRec."E-Mail")
            {

            }
            column(DivisionHomePage; DivisionRec."Home Page")
            {

            }
            column(DivisionPhoneNo; DivisionRec."Phone No.")
            {

            }
            column(Division_LegalEntityName; DivisionRec."Company Name")
            {

            }
            column(DivisionBankAccNo; DivisionRec."Bank Account No.")
            {
            }
            column(DivisionBankName; DivisionRec."Bank Name")
            {
            }
            column(DivisionSortCode; DivisionRec."Bank Branch No.")
            {
            }
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
    trigger OnInitReport()
    begin


    end;

    trigger OnPreReport()
    var
    begin

    end;

    var
        BodyTextOrderConf: Label 'Dear Customer,';
        BodyTextOrderConf2: Label 'This email and any attachements to it may be confidential and are intended solely for the use of individual to whom it is addressed. Any views or opinions are solely those of the author and do not necessarily represent those of  %1';
        BodyTextOrderConf3: Label 'If you are nit the intended recipient of this mail,you must neither take any action based upon its contents, nor copy or show it to anyone.';
        BodyTextOrderConf4: Label 'Please contact the sender if you believe you have received this email in error';
        BodyTextSalesInv: Label 'This email and any attachements to it may be confidential and are intended solely for the use of individual to whom it is addressed. Any views or opinions are solely those of the author and do not necessarily represent those of  %1';
        BodyTextSalesInv2: Label 'If you are nit the intended recipient of this mail,you must neither take any action based upon its contents, nor copy or show it to anyone.';
        BodyTextSalesInv3: Label 'Please contact the sender if you believe you have received this email in error';
        BodyText1: Text;
        BodyText2: Text;
        BodyText3: Text;
        BodyText4: Text;
        BodyText5: Text;
        BodyText6: Text;
        BodyText7: Text;
        CompanyInfo: Record "Company Information";
        DivisionRec: Record Division;

}
