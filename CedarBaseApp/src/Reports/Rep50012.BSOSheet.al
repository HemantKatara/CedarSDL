report 50012 "BSO_Sheet"
{
    AdditionalSearchTerms = 'BSO Sheet';
    DefaultLayout = RDLC;
    RDLCLayout = './layout/Bso_Custom.rdl';
    Caption = 'Blanket Sales Order Sheet';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING("Document Type", "No.") WHERE("Document Type" = CONST("Blanket Order"));
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Blanket Sales Order';
            column(ShipmentMethodDescription; ShipmentMethod.Description)
            {
            }
            column(PaymentTermsDescription; PaymentTerms.Description)
            {
            }
            column(No_SalesHeader; "No.")
            {
            }
            column(DivisionColor; division."Colour Code")
            {
            }
            column(DivisionLogo; division.Picture)
            {
            }
            column(CustomerDivisionName; Cust_G."Global Dimension 1 Code")
            {
            }
            column(Assigned_User_ID; "Assigned User ID")
            {

            }
            column(YourReference_SalesHeader; "Sales Header"."Your Reference")
            {
            }
            column(PaymentTermsCaption; PaymentTermsCaptionLbl)
            {
            }
            column(ShipmentMethodCaption; ShipmentMethodCaptionLbl)
            {
            }
            column(InvDiscAmountCaption; InvDiscAmountCaptionLbl)
            {
            }
            column(VATPercentCaption; VATPercentCaptionLbl)
            {
            }
            column(VATBaseCaption; VATBaseCaptionLbl)
            {
            }
            column(VATAmountCaption; VATAmountCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {

            }
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {

            }
            column(Sell_to_Phone_No_; Cust_G."Phone No.")
            {

            }
            column(SellToContactPhoneNoLbl; SellToContactPhoneNoLbl)
            {
            }
            column(SellToContactMobilePhoneNoLbl; SellToContactMobilePhoneNoLbl)
            {
            }
            column(SellToContactEmailLbl; SellToContactEmailLbl)
            {
            }
            column(DocDate_SalesHeader; "Sales Header"."Document Date")
            {
            }
            column(OrderDate_SalesHeader; "Sales Header"."Order Date")
            {
            }
            column(BillToContactPhoneNoLbl; BillToContactPhoneNoLbl)
            {
            }
            column(BillToContactMobilePhoneNoLbl; BillToContactMobilePhoneNoLbl)
            {
            }
            column(BillToContactEmailLbl; BillToContactEmailLbl)
            {
            }
            column(SellToContactPhoneNo; SellToContact."Phone No.")
            {
            }
            column(BillToContactAddr1; BillToContact.Address)
            {

            }
            column(BillToContactAddr2; BillToContact."Address 2")
            {

            }
            column(SellToContactMobilePhoneNo; SellToContact."Mobile Phone No.")
            {
            }
            column(SellToContactEmail; SellToContact."E-Mail")
            {
            }
            column(SellToContactAddress1; SellToContact.Address)
            {
            }
            column(SellToContactAddres2; SellToContact."Address 2")
            {
            }
            column(SellToContactCity; SellToContact.City)
            {
            }
            column(SellToContactPostCode; SellToContact."Post Code")
            {
            }
            column(SellToContactCounty; SellToContact."Country/Region Code")
            {
            }
            column(BillToCustomerName; "Sales Header"."Bill-to Name")
            {

            }
            column(BillToContactPhoneNo; BillToContact."Phone No.")
            {
            }
            column(BillToContactMobilePhoneNo; BillToContact."Mobile Phone No.")
            {
            }
            column(BillToContactEmail; BillToContact."E-Mail")
            {
            }
            column(Salesperson_Code; "Salesperson Code")
            {

            }
            column(PaymentMathod; paymentterms.Description)
            {

            }
            column(CustomerMobNo; cust_billTo."Mobile Phone No.")
            {

            }
            column(CustomerPhNo; cust_billTo."Phone No.")
            {

            }
            column(CustomerEmail; cust_billTo."E-Mail")
            {

            }
            column(CustomerAddress; cust_billTo.Address)
            {

            }
            column(PrimaryContactName; cust_billTo.Contact)
            {

            }
            column(InvSubTotal; InvSubTotal)
            {

            }
            column(InvoiceDisPercent; InvoiceDisPercent)
            {

            }
            column(TotalinvDisAmt; TotalinvDisAmt)
            {

            }
            column(TotalAmtExcl; TotalAmtExcl)
            {

            }
            column(TotalAmtIncVat; TotalAmtIncVat)
            {

            }
            column(Text001; Text001)
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(BlanketSalesOrderCopyText; StrSubstNo(Text004, CopyText))
                    {
                    }
                    column(CustAddr1; CustAddr[1])
                    {
                    }

                    column(CustAddr2; CustAddr[2])
                    {
                    }

                    column(CustAddr3; CustAddr[3])
                    {
                    }

                    column(CustAddr4; CustAddr[4])
                    {
                    }

                    column(CustAddr5; CustAddr[5])
                    {
                    }
                    column(CompanyInfo3Picture; CompanyInfo3.Picture)
                    {
                    }
                    column(CompanyInfo2Picture; CompanyInfo."Temporary Picture")
                    {
                    }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }

                    column(CustAddr6; CustAddr[6])
                    {
                    }

                    column(HideValue; Cust_G."Hide Price")
                    {

                    }
                    column(Division_LegalEntityName; Division."Legal Entity Name")
                    {
                    }
                    column(DivisionAddr1; Division.Address)
                    {
                    }
                    column(DivisionName; Division.Name)
                    {
                    }
                    column(DivisionAddr2; Division."Address 2")
                    {
                    }
                    column(DivisionCity; Division.City)
                    {
                    }
                    column(DivisionHomePage; Division."Home Page")
                    {
                    }
                    column(DivisionEmail; Division."E-Mail")
                    {
                    }
                    column(DivisionPhNo; Division."Phone No.")
                    {
                    }
                    column(DivisionVATRegNo; Division."VAT Registration No.")
                    {
                    }
                    column(DivisionPostCode; Division."Post Code")
                    {
                    }
                    column(DivisionRegionCode; Division."Country/Region Code")
                    {
                    }
                    column(DivisionBankName; Division."Bank Name")
                    {
                    }
                    column(DivisionBankAccountNo; Division."Bank Account No.")
                    {
                    }
                    column(DivisionSortCode; Division."Bank Branch No.")
                    {
                    }
                    column(DivisionCompRegNo; Division."Registration No.")
                    {
                    }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompanyInfoBankAccountNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(BilltoCustNo_SalesHeader; "Sales Header"."Bill-to Customer No.")
                    {
                    }
                    column(VATNoText; VATNoText)
                    {
                    }
                    column(VATRegNo_SalesHeader; "Sales Header"."VAT Registration No.")
                    {
                    }
                    column(ShipmentDate_SalesHeader; Format("Sales Header"."Shipment Date"))
                    {
                    }
                    column(SalesPersonText; SalesPersonText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }

                    column(CustAddr7; CustAddr[7])
                    {
                    }
                    column(CustAddr8; CustAddr[8])
                    {
                    }
                    column(ContactAddr1; ContactAddr[1])
                    {

                    }
                    column(ContactAddr2; ContactAddr[2])
                    {

                    }
                    column(ContactAddr3; ContactAddr[3])
                    {

                    }
                    column(ContactAddr4; ContactAddr[4])
                    {

                    }
                    column(ContactAddr5; ContactAddr[5])
                    {

                    }
                    column(ContactAddr6; ContactAddr[6])
                    {

                    }
                    column(ShipToAddr1; ShipToAddr[1])
                    {
                    }
                    column(ShipToAddr2; ShipToAddr[2])
                    {
                    }
                    column(ShipToAddr3; ShipToAddr[3])
                    {
                    }
                    column(ShipToAddr4; ShipToAddr[4])
                    {
                    }
                    column(ShipToAddr5; ShipToAddr[5])
                    {
                    }
                    column(ShipToAddr6; ShipToAddr[6])
                    {
                    }
                    column(ShipToAddr7; ShipToAddr[7])
                    {
                    }
                    column(ShipToAddr8; ShipToAddr[8])
                    {
                    }

                    column(PricesIncVAT_SalesHeader; "Sales Header"."Prices Including VAT")
                    {
                    }
                    column(PageCaption; StrSubstNo(Text005, ''))
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PricesIncVAT1_SalesHeader; Format("Sales Header"."Prices Including VAT"))
                    {
                    }

                    column(PhoneNoCaption; PhoneNoCaptionLbl)
                    {
                    }
                    column(AmountCaption; AmountCaptionLbl)
                    {
                    }
                    column(UnitPriceCaption; UnitPriceCaptionLbl)
                    {
                    }
                    column(VATRegNoCaption; VATRegNoCaptionLbl)
                    {
                    }
                    column(GiroNoCaption; GiroNoCaptionLbl)
                    {
                    }
                    column(BankNameCaption; BankNameCaptionLbl)
                    {
                    }
                    column(BankAcctNoCaption; BankAcctNoCaptionLbl)
                    {
                    }
                    column(ShipmentDateCaption; ShipmentDateCaptionLbl)
                    {
                    }
                    column(BlanketSalesOrderNoCaption; BlanketSalesOrderNoCaptionLbl)
                    {
                    }
                    column(HomePageCaption; HomePageCaptionLbl)
                    {
                    }
                    column(EmailCaption; EmailCaptionLbl)
                    {
                    }
                    column(DocumentDateCaption; DocumentDateCaptionLbl)
                    {
                    }
                    column(BilltoCustNo_SalesHeaderCaption; "Sales Header".FieldCaption("Bill-to Customer No."))
                    {
                    }
                    column(PricesIncVAT_SalesHeaderCaption; "Sales Header".FieldCaption("Prices Including VAT"))
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(Number_IntegerLine; Number)
                        {
                        }
                        column(HeaderDimensionsCaption; HeaderDimensionsCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then begin
                                if not DimSetEntry1.FindSet then
                                    CurrReport.Break();
                            end else
                                if not Continue then
                                    CurrReport.Break();

                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := DimText;
                                if DimText = '' then
                                    DimText := StrSubstNo('%1 %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                else
                                    DimText :=
                                      StrSubstNo(
                                        '%1, %2 %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                    DimText := OldDimText;
                                    Continue := true;
                                    exit;
                                end;
                            until DimSetEntry1.Next() = 0;

                        end;

                        trigger OnPreDataItem()
                        begin
                            if not ShowInternalInfo then
                                CurrReport.Break();
                        end;
                    }
                    dataitem(TempCommentLoop; Integer)
                    {
                        column(Comment_TempCommentLine; CommentTxt)//HK_130123
                        {

                        }
                        column(Date_TempCommentLine; FORMAT(DT2Date(TempCommentLine."Created DateTime"), 0, '<Day,2>.<Month,2>.<Year,2>'))
                        {

                        }
                        column(TypeComment; TempCommentLine."Comment Type")
                        {

                        }
                        column(CreatedBy_TempCommentLine; TempCommentLine."Created By")
                        {

                        }
                        column(SequenceNo_TempCommentLine; TempCommentLine."Line No.")
                        {

                        }
                        trigger OnPreDataItem()
                        var
                        begin
                            TempCommentLine.RESET;
                            if not TempCommentLine.FindSet() then
                                CurrReport.Break();
                            TempCommentLine.FINDSET;
                            TempCommentLoop.SETRANGE(Number, 1, TempCommentLine.COUNT);
                            TempCommentLine.SetCurrentKey("Created DateTime");
                            TempCommentLine.SetAscending("Created DateTime", false);
                        end;

                        trigger OnAfterGetRecord()
                        var
                            Instr: InStream;
                        begin
                            Clear(CommentTxt);
                            IF TempCommentLoop.Number = 1 THEN
                                TempCommentLine.FINDFIRST
                            ELSE
                                TempCommentLine.NEXT;
                            if TempCommentLine."Comment SMDX".HasValue then begin
                                TempCommentLine.CalcFields("Comment SMDX");
                                TempCommentLine."Comment SMDX".CreateInStream(Instr);//HK_130123
                                instr.ReadText(CommentTxt);
                            end;
                        end;
                    }
                    dataitem("Sales Line"; "Sales Line")
                    {
                        DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = SORTING("Document Type", "Document No.", "Line No.") Where("Carriage Line" = filter(false));

                        trigger OnPreDataItem()
                        begin
                            CurrReport.Break();
                        end;
                    }
                    dataitem(RoundLoop; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(SalesLineTypeInt; SalesLineTypeInt)
                        {
                        }
                        column(VATBaseDisc_SalesHeader; "Sales Header"."VAT Base Discount %")
                        {
                        }
                        column(TotalSalesInvDiscAmount; TotalSalesInvDiscAmount)
                        {
                        }
                        column(TotalSalesLineAmount; TotalSalesLineAmount)
                        {
                        }

                        column(LineNo_SalesLine; "Sales Line"."Line No.")
                        {
                        }
                        column(SalesLineDescription; SalesLine.Description)
                        {
                        }
                        column(No_SalesLine; "Sales Line"."No.")
                        {
                        }
                        column(No_SalesLineCaption; "Sales Line".FieldCaption("No."))
                        {
                        }
                        column(DescriptionRL_SalesLine; "Sales Line".Description)
                        {
                        }
                        column(Quantity_SalesLine; "Sales Line".Quantity)
                        {
                        }
                        column(UnitofMeasure_SalesLine; "Sales Line"."Unit of Measure Code")
                        {
                        }
                        column(AmtIncVat_salesLine; SalesLine."Amount Including VAT")
                        {
                        }
                        column(LineAmountRL_SalesLine; "Sales Line"."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(UnitPrice_SalesLine; Round("Sales Line"."Unit Price" / "Sales Line"."Qty. per Unit of Measure", 0.01))
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 2;

                        }
                        column(itemPrice; "Sales Line"."Unit Price")
                        {

                        }
                        column(UOM_item; itemRec."Base Unit of Measure")
                        {

                        }


                        column(ShipmentDate_SalesLine; Format("Sales Line"."Shipment Date"))
                        {
                            AutoFormatType = 1;
                        }
                        column(VATIdentifier_SalesLine; "Sales Line"."VAT Identifier")
                        {
                        }
                        column(SalesLineInvDiscountAmt; -SalesLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalText; TotalText)
                        {
                        }
                        column(SalesLineLnAmtInvDiscAmt; SalesLine."Line Amount" - SalesLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmountText; VATAmountLine.VATAmountText)
                        {
                        }
                        column(TotalExclVATText; TotalExclVATText)
                        {
                        }
                        column(TotalInclVATText; TotalInclVATText)
                        {
                        }
                        column(VATAmount; VATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(LineDiscpersent; SalesLine."Line Discount %")
                        {

                        }
                        column(LineDisSubTotal; SalesLine."Line Discount Amount")
                        {

                        }
                        column(InvDisAmt_SalesLine; SalesLine."Inv. Discount Amount")
                        {

                        }
                        column(SlLnLnAmtInvDiscAmtVATAmt; SalesLine."Line Amount" - SalesLine."Inv. Discount Amount" + VATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATDiscountAmount; -VATDiscountAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalAmountInclVAT; TotalAmountInclVAT)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATBaseAmount; VATBaseAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(SubtotalCaption; SubtotalCaptionLbl)
                        {
                        }
                        column(PaymentDiscountCaption; PaymentDiscountCaptionLbl)
                        {
                        }
                        column(DescriptionRL_SalesLineCaption; "Sales Line".FieldCaption(Description))
                        {
                        }
                        column(Quantity_SalesLineCaption; "Sales Line".FieldCaption(Quantity))
                        {
                        }
                        column(UnitofMeasure_SalesLineCaption; "Sales Line".FieldCaption("Unit of Measure"))
                        {
                        }
                        column(VATIdentifier_SalesLineCaption; "Sales Line".FieldCaption("VAT Identifier"))
                        {
                        }
                        column(Group_salesLine; SalesLine.Group)
                        {
                        }
                        column(invoiceDate_salesLine; SalesLine."Invoice Date")
                        {
                        }

                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                            column(DimText1; DimText)
                            {
                            }
                            column(LineDimensionsCaption; LineDimensionsCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then begin
                                    if not DimSetEntry2.Find('-') then
                                        CurrReport.Break();
                                end else
                                    if not Continue then
                                        CurrReport.Break();

                                Clear(DimText);
                                Continue := false;
                                repeat
                                    OldDimText := DimText;
                                    if DimText = '' then
                                        DimText := StrSubstNo('%1 %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    else
                                        DimText :=
                                          StrSubstNo(
                                            '%1, %2 %3', DimText,
                                            DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                        DimText := OldDimText;
                                        Continue := true;
                                        exit;
                                    end;
                                until DimSetEntry2.Next() = 0;

                            end;

                            trigger OnPreDataItem()
                            begin
                                if not ShowInternalInfo then
                                    CurrReport.Break();

                                DimSetEntry2.SetRange("Dimension Set ID", "Sales Line"."Dimension Set ID");
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then
                                SalesLine.Find('-')
                            else
                                SalesLine.Next;
                            "Sales Line" := SalesLine;

                            if "Sales Line"."Carriage Line" then
                                CurrReport.Skip();

                            if not "Sales Header"."Prices Including VAT" and
                               (SalesLine."VAT Calculation Type" = SalesLine."VAT Calculation Type"::"Full VAT")
                            then
                                SalesLine."Line Amount" := 0;

                            if (SalesLine.Type = SalesLine.Type::"G/L Account") and (not ShowInternalInfo) then
                                "Sales Line"."No." := '';

                            SalesLineTypeInt := SalesLine.Type.AsInteger();
                            TotalSalesLineAmount += SalesLine."Line Amount";
                            TotalSalesInvDiscAmount += SalesLine."Inv. Discount Amount";

                            if itemRec.Get("Sales Line"."No.") then;
                            //  Message('%1', itemRec."No.");
                        end;

                        trigger OnPostDataItem()
                        begin
                            SalesLine.DeleteAll();
                        end;

                        trigger OnPreDataItem()
                        begin
                            MoreLines := SalesLine.Find('+');
                            while MoreLines and (SalesLine.Description = '') and (SalesLine."Description 2" = '') and
                                  (SalesLine."No." = '') and (SalesLine.Quantity = 0) and
                                  (SalesLine.Amount = 0)
                            do
                                MoreLines := SalesLine.Next(-1) <> 0;
                            if not MoreLines then
                                CurrReport.Break();
                            SalesLine.SetRange("Line No.", 0, SalesLine."Line No.");
                            SetRange(Number, 1, SalesLine.Count);

                            TotalSalesLineAmount := 0;
                            TotalSalesInvDiscAmount := 0;


                        end;
                    }
                    dataitem(VATCounter; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(VATAmountLineVATBase; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLineVATAmount; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLineLineAmount; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscBaseAmt; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscountAmt; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLineVAT; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier; VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VATAmtSpecificationCaption; VATAmtSpecificationCaptionLbl)
                        {
                        }
                        column(VATIdentifierCaption; VATIdentifierCaptionLbl)
                        {
                        }
                        column(InvDiscBaseAmountCaption; InvDiscBaseAmountCaptionLbl)
                        {
                        }
                        column(LineAmountCaption; LineAmountCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem()
                        begin
                            if VATAmount = 0 then
                                CurrReport.Break();
                            SetRange(Number, 1, VATAmountLine.Count);
                        end;
                    }
                    dataitem(VATCounterLCY; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(VALExchRate; VALExchRate)
                        {
                        }
                        column(VALSpecLCYHeader; VALSpecLCYHeader)
                        {
                        }
                        column(VALVATAmountLCY; VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATBaseLCY; VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATPercentage; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifierVCL; VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VATIdentifierVCLCaption; VATIdentifierVCLCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                            VALVATBaseLCY :=
                              VATAmountLine.GetBaseLCY(
                                "Sales Header"."Posting Date", "Sales Header"."Currency Code", "Sales Header"."Currency Factor");
                            VALVATAmountLCY :=
                              VATAmountLine.GetAmountLCY(
                                "Sales Header"."Posting Date", "Sales Header"."Currency Code", "Sales Header"."Currency Factor");
                        end;

                        trigger OnPreDataItem()
                        begin
                            if (not GLSetup."Print VAT specification in LCY") or
                               ("Sales Header"."Currency Code" = '') or
                               (VATAmountLine.GetTotalVATAmount = 0)
                            then
                                CurrReport.Break();

                            SetRange(Number, 1, VATAmountLine.Count);
                            Clear(VALVATBaseLCY);
                            Clear(VALVATAmountLCY);

                            if GLSetup."LCY Code" = '' then
                                VALSpecLCYHeader := Text007 + Text008
                            else
                                VALSpecLCYHeader := Text007 + Format(GLSetup."LCY Code");

                            CurrExchRate.FindCurrency(WorkDate, "Sales Header"."Currency Code", 1);
                            VALExchRate := StrSubstNo(Text009, CurrExchRate."Relational Exch. Rate Amount", CurrExchRate."Exchange Rate Amount");
                        end;
                    }
                    dataitem(Total; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    }
                    dataitem(Total2; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(SelltoCustNo_SalesHeader; "Sales Header"."Sell-to Customer No.")
                        {
                        }

                        column(ShiptoAddressCaption; ShiptoAddressCaptionLbl)
                        {
                        }
                        column(SelltoCustNo_SalesHeaderCaption; "Sales Header".FieldCaption("Sell-to Customer No."))
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            if not ShowShippingAddr then
                                CurrReport.Break();
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                var
                    SalesPost: Codeunit "Sales-Post";
                begin
                    Clear(SalesLine);
                    Clear(SalesPost);
                    SalesLine.DeleteAll();
                    VATAmountLine.DeleteAll();
                    SalesPost.GetSalesLines("Sales Header", SalesLine, 0);
                    SalesLine.CalcVATAmountLines(0, "Sales Header", SalesLine, VATAmountLine);
                    SalesLine.UpdateVATOnLines(0, "Sales Header", SalesLine, VATAmountLine);
                    VATAmount := VATAmountLine.GetTotalVATAmount;
                    VATBaseAmount := VATAmountLine.GetTotalVATBase;
                    VATDiscountAmount :=
                      VATAmountLine.GetTotalVATDiscount("Sales Header"."Currency Code", "Sales Header"."Prices Including VAT");
                    TotalAmountInclVAT := VATAmountLine.GetTotalAmountInclVAT;


                    if Number > 1 then begin
                        CopyText := FormatDocument.GetCOPYText;
                        OutputNo += 1;
                    end;
                end;

                trigger OnPostDataItem()
                begin
                    if not IsReportInPreviewMode then
                        CODEUNIT.Run(CODEUNIT::"Sales-Printed", "Sales Header");
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := Abs(NoOfCopies) + 1;
                    CopyText := '';
                    SetRange(Number, 1, NoOfLoops);
                    OutputNo := 1;

                end;
            }

            trigger OnAfterGetRecord()
            var
                GenLedgerSetup: Record "General Ledger Setup";
                DimSetId: Record "Dimension Set Entry";
                Outstr: OutStream;
                Instr_L: InStream;
            begin
                Clear(UserName);
                CurrReport.Language := Language_G.GetLanguageIdOrDefault("Language Code");

                FormatAddressFields("Sales Header");
                FormatDocumentFields("Sales Header");
                if SellToContact.Get("Sell-to Contact No.") then;
                if BillToContact.Get("Bill-to Contact No.") then;
                DimSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");

                if not IsReportInPreviewMode then
                    if ArchiveDocument then
                        ArchiveManagement.StoreSalesDocument("Sales Header", LogInteraction);

                Cust_G.Get("Sell-to Customer No.");

                cust_billTo.get("Bill-to Customer No.");

                //CommentLine

                TempCommentLine.DeleteAll();
                TempCommentLine.Reset();
                CommentLine.Reset();
                CommentLine.SetRange("Table Name", 1);
                CommentLine.SetRange("No.", Cust_G."No.");
                if CommentLine.FindSet() then begin
                    repeat
                        TempCommentLine.Init();
                        // TempCommentLine."Document Type" := CommentLine."Document Type";
                        // TempCommentLine."Document Line No." := CommentLine."Document Line No.";
                        // TempCommentLine."No." := CommentLine."No.";
                        // TempCommentLine."Line No." := CommentLine."Line No.";
                        // TempCommentLine.Comment := CommentLine.Comment;
                        // TempCommentLine.Date := CommentLine.Date;
                        TempCommentLine.TransferFields(CommentLine);
                        if CommentLine."Comment SMDX".HasValue then begin
                            CommentLine.CalcFields("Comment SMDX");
                            CommentLine."Comment SMDX".CreateInStream(Instr_L);
                            TempCommentLine."Comment SMDX".CreateOutStream(Outstr);
                            CopyStream(Outstr, Instr_L);
                        end;
                        User.SetRange("User Name", CommentLine."Created By");
                        if User.FindFirst() then
                            if user."Full Name" <> '' then
                                TempCommentLine."Created By" := user."Full Name"
                            else
                                TempCommentLine."Created By" := user."User Name";
                        TempCommentLine.Insert();
                        user.Reset();
                    until CommentLine.Next() = 0;
                end;
                IF TempCommentLine.FINDSET THEN;

                // Calculate Discount Amt
                InvSubTotal := 0;
                TotalinvDisAmt := 0;
                TotalAmtExcl := 0;
                TotalAmtIncVat := 0;
                SLine_G.Reset();
                SLine_G.SetRange("Document Type", "Sales Header"."Document Type");
                SLine_G.SetRange("Document No.", "Sales Header"."No.");
                SLine_G.SetFilter(Type, '%1', SLine_G.Type::Item);
                if SLine_G.FindSet() then
                    repeat
                        InvSubTotal += SLine_G."Line Amount";
                        TotalinvDisAmt += SLine_G."Inv. Discount Amount";
                        TotalAmtExcl += SLine_G."VAT Base Amount";
                        TotalAmtIncVat += SLine_G."Amount Including VAT";
                    until SLine_G.Next() = 0;

                InvoiceDisPercent := 0;
                SLine_G.Reset();
                SLine_G.SetRange("Document Type", "Sales Header"."Document Type");
                SLine_G.SetRange("Document No.", "Sales Header"."No.");
                if SLine_G.FindFirst() then
                    if (SLine_G."Inv. Discount Amount" <> 0) and (SLine_G."Line Amount" <> 0) then
                        InvoiceDisPercent := Round(((SLine_G."Inv. Discount Amount" / SLine_G."Line Amount") * 100), 0.01);

                // Get report logo
                GenLedgerSetup.Get();
                DimSetId.Reset();
                DimSetId.SetRange("Dimension Set ID", "Sales Header"."Dimension Set ID");
                DimSetId.SetFilter("Dimension Code", GenLedgerSetup."Global Dimension 1 Code");
                if DimSetId.FindFirst() then begin
                    Division.get(DimSetId."Dimension Value Code");
                    Division.CalcFields(Picture);
                end;

                IF Cust_G."Global Dimension 1 Code" <> DimSetId."Dimension Value Code" then begin
                    Error('Customer Default Dimension %1 Does Not Match With Document Default Dimension %2', Cust_G."Global Dimension 1 Code", DimSetId."Dimension Value Code");
                end;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = Suite;
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies if you want the printed report to show information that is only for internal use.';
                    }
                    field(ArchiveDocument; ArchiveDocument)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Archive Document';
                        ToolTip = 'Specifies whether to archive the order.';

                        trigger OnValidate()
                        begin
                            if not ArchiveDocument then
                                LogInteraction := false;
                        end;
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if you want the program to log this interaction.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            LogInteractionEnable := true;
            ArchiveDocument := SalesSetup."Archive Blanket Orders";
        end;

        trigger OnOpenPage()
        begin
            InitLogInteraction;
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        GLSetup.Get();
        CompanyInfo.Get();
        SalesSetup.Get();
        FormatDocument.SetLogoPosition(SalesSetup."Logo Position on Documents", CompanyInfo1, CompanyInfo2, CompanyInfo3);
    end;

    trigger OnPostReport()
    begin
        if LogInteraction and not IsReportInPreviewMode then
            if "Sales Header".FindSet then
                repeat
                    "Sales Header".CalcFields("No. of Archived Versions");
                    if "Sales Header"."Bill-to Contact No." <> '' then
                        SegManagement.LogDocument(
                          2, "Sales Header"."No.", "Sales Header"."Doc. No. Occurrence",
                          "Sales Header"."No. of Archived Versions", DATABASE::Contact, "Sales Header"."Bill-to Contact No.",
                          "Sales Header"."Salesperson Code", "Sales Header"."Campaign No.", "Sales Header"."Posting Description",
                          "Sales Header"."Opportunity No.")
                    else
                        SegManagement.LogDocument(
                          2, "Sales Header"."No.", "Sales Header"."Doc. No. Occurrence",
                          "Sales Header"."No. of Archived Versions", DATABASE::Customer, "Sales Header"."Bill-to Customer No.",
                          "Sales Header"."Salesperson Code", "Sales Header"."Campaign No.", "Sales Header"."Posting Description",
                          "Sales Header"."Opportunity No.");

                until "Sales Header".Next() = 0;
    end;

    trigger OnPreReport()
    begin
        if not CurrReport.UseRequestPage then
            InitLogInteraction;
    end;

    var
        Text004: Label 'Blanket Sales Order %1', Comment = '%1 = Document No.';
        Text005: Label 'Page %1';
        TotalQty: Decimal;
        InvSubTotal: Decimal;
        InvoiceDisPercent: Decimal;
        TotalinvDisAmt: Decimal;
        TotalAmtExcl: Decimal;
        TotalAmtIncVat: Decimal;
        SLine_G: Record "Sales Line";
        GLSetup: Record "General Ledger Setup";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInfo3: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        CompanyInfo: Record "Company Information";
        VATAmountLine: Record "VAT Amount Line" temporary;
        SalesLine: Record "Sales Line" temporary;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        RespCenter: Record "Responsibility Center";
        CurrExchRate: Record "Currency Exchange Rate";
        SellToContact: Record Contact;
        BillToContact: Record Contact;
        Language_G: Codeunit Language;
        UserName: Text[100];
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        ArchiveManagement: Codeunit ArchiveManagement;
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        ContactAddr: array[9] of Text[100];

        BillToAddr: array[8] of text[100];
        ShipToAddr2: array[8] of Text[100];
        SalesPersonText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        TotalText: Text[50];
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        SalesLineTypeInt: Integer;
        OutputNo: Integer;
        CopyText: Text[30];
        ShowShippingAddr: Boolean;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        VATAmount: Decimal;
        VATBaseAmount: Decimal;
        VATDiscountAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        LogInteraction: Boolean;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        TotalSalesLineAmount: Decimal;
        TotalSalesInvDiscAmount: Decimal;
        VALSpecLCYHeader: Text[80];
        VALExchRate: Text[50];
        LineDiscpersent: Decimal;
        LineDisAmt: Decimal;
        LineDisSubTotal: Decimal;
        GrandTotal: Decimal;
        user: Record User;
        Text007: Label 'VAT Amount Specification in ';
        Text008: Label 'Local Currency';
        Text009: Label 'Exchange rate: %1/%2';
        ArchiveDocument: Boolean;
        LogInteractionEnable: Boolean;
        PaymentTermsCaptionLbl: Label 'Payment Terms';
        ShipmentMethodCaptionLbl: Label 'Shipment Method';
        PhoneNoCaptionLbl: Label 'Phone No.';
        AmountCaptionLbl: Label 'Amount';
        UnitPriceCaptionLbl: Label 'Unit Price';
        VATRegNoCaptionLbl: Label 'VAT Registration No.';
        GiroNoCaptionLbl: Label 'Giro No.';
        BankNameCaptionLbl: Label 'Bank';
        BankAcctNoCaptionLbl: Label 'Account No.';
        ShipmentDateCaptionLbl: Label 'Shipment Date';
        BlanketSalesOrderNoCaptionLbl: Label 'Blanket Sales Order No.';
        HomePageCaptionLbl: Label 'Home Page';
        EmailCaptionLbl: Label 'Email';
        DocumentDateCaptionLbl: Label 'Document Date';
        HeaderDimensionsCaptionLbl: Label 'Header Dimensions';
        SubtotalCaptionLbl: Label 'Subtotal';
        PaymentDiscountCaptionLbl: Label 'Payment Discount on VAT';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        VATAmtSpecificationCaptionLbl: Label 'VAT Amount Specification';
        VATIdentifierCaptionLbl: Label 'VAT Identifier';
        InvDiscBaseAmountCaptionLbl: Label 'Invoice Discount Base Amount';
        LineAmountCaptionLbl: Label 'Line Amount';
        VATIdentifierVCLCaptionLbl: Label 'VAT Identifier';
        ShiptoAddressCaptionLbl: Label 'Ship-to Address';
        InvDiscAmountCaptionLbl: Label 'Invoice Discount Amount';
        VATPercentCaptionLbl: Label 'VAT %';
        VATBaseCaptionLbl: Label 'VAT Base';
        VATAmountCaptionLbl: Label 'VAT Amount';
        TotalCaptionLbl: Label 'Total';
        SellToContactPhoneNoLbl: Label 'Sell-to Contact Phone No.';
        SellToContactMobilePhoneNoLbl: Label 'Sell-to Contact Mobile Phone No.';
        SellToContactEmailLbl: Label 'Sell-to Contact E-Mail';
        BillToContactPhoneNoLbl: Label 'Bill-to Contact Phone No.';
        BillToContactMobilePhoneNoLbl: Label 'Bill-to Contact Mobile Phone No.';
        BillToContactEmailLbl: Label 'Bill-to Contact E-Mail';
        Text001: Label 'Any amendments to this order must be made by close of business of the next working day after receipt of this email confirmation';
        DivisionColor: Text[30];
        VerifiedOrdLbl: Label 'Verified Order';
        CommentLine: Record "Comment Line";
        Division: Record Division;
        CommentDate: Date;
        Comment_G: Text;
        TempCommentLine: Record "Comment Line" temporary;
        itemRec: Record Item;
        cust_billTo: Record Customer;
        Cust_G: Record Customer;
        ShipToOptions_G: Option "Default (Sell-to Address)","Alternate Shipping Address","Custom Address";
        CommentTxt: Text;

    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewArchiveDocument: Boolean; NewLogInteraction: Boolean)
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        ArchiveDocument := NewArchiveDocument;
        LogInteraction := NewLogInteraction;
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody);
    end;

    local procedure InitLogInteraction()
    var
        DocumentType: Enum "Interaction Log Entry Document Type";
    begin
        //LogInteraction := SegManagement.FindInteractTmplCode(2) <> '';
        LogInteraction := SegManagement.FindInteractionTemplateCode(DocumentType::"Sales Blnkt. Ord") <> '';
    end;

    local procedure FormatAddressFields(var SalesHeader: Record "Sales Header")
    begin
        FormatAddr.GetCompanyAddr(SalesHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.SalesHeaderBillTo(CustAddr, SalesHeader);
        if SalesHeader."Ship-to Name" <> '' then
            FormatAddr.SalesHeaderShipTo(ShipToAddr, CustAddr, SalesHeader)
        else
            FormatAddr.SalesHeaderSellTo(ShipToAddr, SalesHeader);
    end;

    local procedure FormatDocumentFields(SalesHeader: Record "Sales Header")
    begin
        FormatDocument.SetTotalLabels(SalesHeader."Currency Code", TotalText, TotalInclVATText, TotalExclVATText);
        FormatDocument.SetSalesPerson(SalesPurchPerson, SalesHeader."Salesperson Code", SalesPersonText);
        FormatDocument.SetPaymentTerms(PaymentTerms, SalesHeader."Payment Terms Code", SalesHeader."Language Code");
        FormatDocument.SetShipmentMethod(ShipmentMethod, SalesHeader."Shipment Method Code", SalesHeader."Language Code");

        ReferenceText := FormatDocument.SetText(SalesHeader."Your Reference" <> '', SalesHeader.FieldCaption("Your Reference"));
        VATNoText := FormatDocument.SetText(SalesHeader."VAT Registration No." <> '', SalesHeader.FieldCaption("VAT Registration No."));
    end;
}

