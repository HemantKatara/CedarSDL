report 50117 "Copy_Reminder"
{
    DefaultLayout = RDLC;
    RDLCLayout = './layout/Copy_Reminder.rdl';
    Caption = 'Reminder';

    dataset
    {
        dataitem("Issued Reminder Header"; "Issued Reminder Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
            RequestFilterHeading = 'Reminder';

            column(No_IssuedReminderHeader; "No.")
            {
            }
            column(DueDateCaption; DueDateCaptionLbl)
            {
            }
            column(ShowMIRLines; ShowMIRLines)
            {
            }
            column(DocumentDateCaption; DocumentDateCaptionLbl)
            {
            }
            column(ContactPhoneNoLbl; ContactPhoneNoLbl)
            {
            }
            column(ContactMobilePhoneNoLbl; ContactMobilePhoneNoLbl)
            {
            }
            column(ContactEmailLbl; ContactEmailLbl)
            {
            }
            column(ContactPhoneNo; PrimaryContact."Phone No.")
            {
            }
            column(ContactMobilePhoneNo; PrimaryContact."Mobile Phone No.")
            {
            }
            column(ContactEmail; PrimaryContact."E-mail")
            {
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));

                column(DivisionName; DivisionAddr[1])
                {
                }
                column(DivAddr; DivisionAddr[2])
                {
                }
                column(DivAddr2; DivisionAddr[3])
                {
                }
                column(DivDim1Code; DivisionAddr[4])
                {
                }
                column(DivisionHomePage; DivisionAddr[5])
                {
                }
                column(DivisionEmail; DivisionAddr[6])
                {
                }
                column(DivisionDispatchEmail; DivisionAddr[7])
                {
                }
                column(DivisionCompanyName; DivisionAddr[8])
                {
                }
                column(DivisionLegalEntityName; DivisionAddr[9])
                {
                }
                column(DivisionColourCode; DivisionAddr[10])
                {
                }
                column(DivisionPicture; DivisionInfo.Picture)
                {
                }
                column(DivisionCity; DivisionAddr[12])
                {
                }
                column(DivisionPostCode; DivisionAddr[13])
                {
                }
                column(DivisionCountryRegionCode; DivisionAddr[14])
                {
                }
                column(DivisionPhoneNo; DivisionAddr[15])
                {
                }
                column(DivisionVatRegistrationNo; DivisionAddr[16])
                {
                }
                column(DivisionBankName; DivisionAddr[17])
                {
                }
                column(DivisionBranchNo; DivisionAddr[18])
                {
                }
                column(DivisionBankAccountNo; DivisionAddr[19])
                {
                }
                column(DivisionRegistrationNo; DivisionAddr[20])
                {
                }
                column(CompanyInfo2Picture; CompanyInfo2.Picture)
                {
                }
                column(CompanyInfo1Picture; CompanyInfo1.Picture)
                {
                }
                column(CompanyInfo3Picture; CompanyInfo3.Picture)
                {
                }
                column(DueDate_IssuedReminderHeader; Format("Issued Reminder Header"."Due Date"))
                {
                }
                column(PostingDate_IssuedReminderHeader; Format("Issued Reminder Header"."Posting Date"))
                {
                }
                column(YourRef_IssuedReminderHeader; "Issued Reminder Header"."Your Reference")
                {
                }
                column(Contact_IssuedReminderHdr; "Issued Reminder Header".Contact)
                {
                }
                column(ReferenceText; ReferenceText)
                {
                }
                column(VATRegNo_IssuedReminderHeader; "Issued Reminder Header".GetCustomerVATRegistrationNumber)
                {
                }
                column(VATNoText; VATNoText)
                {
                }
                column(DocDate_IssuedReminderHeader; Format("Issued Reminder Header"."Document Date"))
                {
                }
                column(CustNo_IssuedReminderHeader; "Issued Reminder Header"."Customer No.")
                {
                }
                column(CompanyInfoBankAccountNo; CompanyInfo."Bank Account No.")
                {
                }
                column(CompanyInfoBankName; CompanyInfo."Bank Name")
                {
                }
                column(CompanyInfoVATRegNo; CompanyInfo.GetVATRegistrationNumber)
                {
                }
                column(CompanyInfoHomePage; CompanyInfo."Home Page")
                {
                }
                column(CompanyInfoEmail; CompanyInfo."E-Mail")
                {
                }
                column(CustAddr8; CustAddr[8])
                {
                }
                column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                {
                }
                column(CustAddr7; CustAddr[7])
                {
                }
                column(CustAddr6; CustAddr[6])
                {
                }
                column(CompanyAddr6; CompanyAddr[6])
                {
                }
                column(CustAddr5; CustAddr[5])
                {
                }
                column(CompanyAddr5; CompanyAddr[5])
                {
                }
                column(CustAddr4; CustAddr[4])
                {
                }
                column(CompanyAddr4; CompanyAddr[4])
                {
                }
                column(CustAddr3; CustAddr[3])
                {
                }
                column(CompanyAddr3; CompanyAddr[3])
                {
                }
                column(CustAddr2; CustAddr[2])
                {
                }
                column(CompanyAddr2; CompanyAddr[2])
                {
                }
                column(CustAddr1; CustAddr[1])
                {
                }
                column(CompanyAddr1; CompanyAddr[1])
                {
                }
                column(PageCaption; PageCaptionLbl)
                {
                }
                column(CompanyInfoBankBranchNo; CompanyInfo."Bank Branch No.")
                {
                }
                column(PostingDateCaption; PostingDateCaptionLbl)
                {
                }
                column(ReminderNoCaption; ReminderNoCaptionLbl)
                {
                }
                column(BankAccountNoCaption; BankAccountNoCaptionLbl)
                {
                }
                column(BankNameCaption; BankNameCaptionLbl)
                {
                }
                column(VATRegNoCaption; "Issued Reminder Header".GetCustomerVATRegistrationNumberLbl)
                {
                }
                column(EmailCaption; EmailCaptionLbl)
                {
                }
                column(HomePageCaption; HomePageCaptionLbl)
                {
                }
                column(PhoneNoCaption; PhoneNoCaptionLbl)
                {
                }
                column(ReminderCaption; ReminderLavelCP)
                {
                }
                column(CompanyVATRegistrationNoCaption; CompanyInfo.GetVATRegistrationNumberLbl)
                {
                }
                column(BankBranchNoCaption; BankBranchNoCaptionLbl)
                {
                }
                column(CustNo_IssuedReminderHeaderCaption; "Issued Reminder Header".FieldCaption("Customer No."))
                {
                }
                dataitem(DimensionLoop; "Integer")
                {
                    DataItemLinkReference = "Issued Reminder Header";
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
                            if not DimSetEntry.FindSet then CurrReport.Break();
                        end
                        else
                            if not Continue then CurrReport.Break();
                        Clear(DimText);
                        Continue := false;
                        repeat
                            OldDimText := DimText;
                            if DimText = '' then
                                DimText := StrSubstNo('%1 - %2', DimSetEntry."Dimension Code", DimSetEntry."Dimension Value Code")
                            else
                                DimText := StrSubstNo('%1; %2 - %3', DimText, DimSetEntry."Dimension Code", DimSetEntry."Dimension Value Code");
                            if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                DimText := OldDimText;
                                Continue := true;
                                exit;
                            end;
                        until DimSetEntry.Next() = 0;
                    end;

                    trigger OnPreDataItem()
                    begin
                        if not ShowInternalInfo then CurrReport.Break();
                    end;
                }
                dataitem("Issued Reminder Line"; "Issued Reminder Line")
                {
                    DataItemLink = "Reminder No." = FIELD("No.");
                    DataItemLinkReference = "Issued Reminder Header";
                    DataItemTableView = SORTING("Reminder No.", "Line No.");

                    column(RemAmt_IssuedReminderLine; "Remaining Amount")
                    {
                        AutoFormatExpression = GetCurrencyCodeFromHeader;
                        AutoFormatType = 1;
                    }
                    column(Desc_IssuedReminderLine; description_L)//Description
                    {
                    }
                    column(Type_IssuedReminderLine; Format(Type, 0, 2))
                    {
                    }
                    column(DocDate_IssuedReminderLine; Format("Document Date"))
                    {
                    }
                    column(DocNo_IssuedReminderLine; "Document No.")
                    {
                    }
                    column(DocNoCaption_IssuedReminderLine; FieldCaption("Document No."))
                    {
                    }
                    column(DueDate_IssuedReminderLine; Format("Due Date"))
                    {
                    }
                    column(OrgAmt_IssuedReminderLine; "Original Amount")
                    {
                        AutoFormatExpression = GetCurrencyCodeFromHeader;
                        AutoFormatType = 1;
                    }
                    column(DocType_IssuedReminderLine; "Document Type")
                    {
                    }
                    column(No_IssuedReminderLine; "No.")
                    {
                    }
                    column(ShowInternalInfo; ShowInternalInfo)
                    {
                    }
                    column(VATAmtIssRemHdrAddFeeInclVAT; (TotalRemIntAmount + "VAT Amount" + "Issued Reminder Header"."Additional Fee" - AddFeeInclVAT) / (VATInterest / 100 + 1))
                    {
                        AutoFormatExpression = "Issued Reminder Line".GetCurrencyCodeFromHeader;
                        AutoFormatType = 1;
                    }
                    column(NNCInterestAmount; NNC_InterestAmount)
                    {
                    }
                    column(TotalRemIntAmount; TotalRemIntAmount)
                    {
                    }
                    column(TotalText; TotalText)
                    {
                    }
                    column(MIREntry_IssuedReminderLine; "Detailed Interest Rates Entry")
                    {
                    }
                    column(NNCTotal; NNC_Total)
                    {
                    }
                    column(TotalInclVATText; TotalInclVATText)
                    {
                    }
                    column(NNCVATAmount; NNC_VATAmount)
                    {
                    }
                    column(NNCTotalInclVAT; NNC_TotalInclVAT)
                    {
                    }
                    column(TotalVATAmt; TotalVATAmount)
                    {
                    }
                    column(Rem_IssuedReminderLine; "Reminder No.")
                    {
                    }
                    column(InterestAmountCaption; InterestAmountCaptionLbl)
                    {
                    }
                    column(VATAmountCaption; VATAmountCaptionLbl)
                    {
                    }
                    column(RemAmt_IssuedReminderLineCaption; FieldCaption("Remaining Amount"))
                    {
                    }
                    column(DocNo_IssuedReminderLineCaption; FieldCaption("Document No."))
                    {
                    }
                    column(OrgAmt_IssuedReminderLineCaption; FieldCaption("Original Amount"))
                    {
                    }
                    column(DocType_IssuedReminderLineCaption; FieldCaption("Document Type"))
                    {
                    }
                    column(Interest; Interest)
                    {
                    }
                    column(RemainingAmountText; RemainingAmt)
                    {
                    }
                    trigger OnAfterGetRecord()
                    begin
                        Clear(description_L);
                        if not "Detailed Interest Rates Entry" then begin
                            VATAmountLine.Init();
                            VATAmountLine."VAT Identifier" := "VAT Identifier";
                            VATAmountLine."VAT Calculation Type" := "VAT Calculation Type";
                            VATAmountLine."Tax Group Code" := "Tax Group Code";
                            VATAmountLine."VAT %" := "VAT %";
                            VATAmountLine."VAT Base" := Amount;
                            VATAmountLine."VAT Amount" := "VAT Amount";
                            VATAmountLine."Amount Including VAT" := Amount + "VAT Amount";
                            VATAmountLine."VAT Clause Code" := "VAT Clause Code";
                            VATAmountLine.InsertLine;
                            ReminderInterestAmount := 0;
                            case Type of
                                Type::"G/L Account":
                                    "Remaining Amount" := Amount;
                                Type::"Line Fee":
                                    "Remaining Amount" := Amount;
                                Type::"Customer Ledger Entry":
                                    ReminderInterestAmount := Amount;
                            end;
                            NNC_InterestAmountTotal += ReminderInterestAmount;
                            NNC_RemainingAmountTotal += "Remaining Amount";
                            NNC_VATAmountTotal += "VAT Amount";
                            NNC_InterestAmount := (NNC_InterestAmountTotal + NNC_VATAmountTotal + "Issued Reminder Header"."Additional Fee" - AddFeeInclVAT + "Issued Reminder Header"."Add. Fee per Line" - AddFeePerLineInclVAT) / (VATInterest / 100 + 1);
                            NNC_Total := NNC_RemainingAmountTotal + NNC_InterestAmountTotal;
                            NNC_VATAmount := NNC_VATAmountTotal;
                            NNC_TotalInclVAT := NNC_RemainingAmountTotal + NNC_InterestAmountTotal + NNC_VATAmountTotal;
                            TotalRemAmt += "Remaining Amount";
                        end;
                        RemainingAmt := '';
                        if ("Remaining Amount" = 0) and ("Due Date" = 0D) then
                            RemainingAmt := ''
                        else
                            RemainingAmt := Format("Remaining Amount");

                        IF ("Document No." = '') and (Description <> '') then
                            description_L := Description;
                    end;

                    trigger OnPreDataItem()
                    begin
                        Clear(CompanyInfo.Picture);
                        Clear(CompanyInfo1.Picture);
                        Clear(CompanyInfo2.Picture);
                        Clear(CompanyInfo3.Picture);
                        if FindLast then begin
                            EndLineNo := "Line No." + 1;
                            repeat
                                Continue := not ShowNotDueAmounts and ("No. of Reminders" = 0) and (((Type = Type::"Customer Ledger Entry") or (Type = Type::"Line Fee")) or (Type = Type::" ")) or "Detailed Interest Rates Entry" and not ShowMIRLines;
                                if Continue then EndLineNo := "Line No.";
                            until (Next(-1) = 0) or not Continue;
                        end;
                        VATAmountLine.DeleteAll();
                        SetFilter("Line No.", '<%1', EndLineNo);
                    end;
                }
                dataitem(IssuedReminderLine2; "Issued Reminder Line")
                {
                    DataItemLink = "Reminder No." = FIELD("No.");
                    DataItemLinkReference = "Issued Reminder Header";
                    DataItemTableView = SORTING("Reminder No.", "Line No.");

                    column(Desc2_IssuedReminderLine; Description)
                    {
                    }
                    column(LineNo2_IssuedReminderLine; "Line No.")
                    {
                    }
                    trigger OnPreDataItem()
                    begin
                        SetFilter("Line No.", '>=%1', EndLineNo);
                        if not ShowNotDueAmounts then begin
                            SetFilter(Type, '<>%1', Type::" ");
                            if FindFirst then
                                if "Line No." > EndLineNo then begin
                                    SetRange(Type);
                                    SetRange("Line No.", EndLineNo, "Line No." - 1); // find "Open Entries Not Due" line
                                    if FindLast then SetRange("Line No.", EndLineNo, "Line No." - 1);
                                end;
                            SetRange(Type);
                        end;
                    end;
                }
                dataitem(VATCounter; "Integer")
                {
                    DataItemTableView = SORTING(Number);

                    column(VATAmtLineAmtInclVAT; VATAmountLine."Amount Including VAT")
                    {
                        AutoFormatExpression = "Issued Reminder Line".GetCurrencyCodeFromHeader;
                        AutoFormatType = 1;
                    }
                    column(VALVATAmount; VALVATAmount)
                    {
                        AutoFormatExpression = "Issued Reminder Line".GetCurrencyCodeFromHeader;
                        AutoFormatType = 1;
                    }
                    column(VALVATBase; VALVATBase)
                    {
                        AutoFormatExpression = "Issued Reminder Line".GetCurrencyCodeFromHeader;
                        AutoFormatType = 1;
                    }
                    column(VALVATBaseVALVATAmount; VALVATBase + VALVATAmount)
                    {
                        AutoFormatExpression = "Issued Reminder Line".GetCurrencyCodeFromHeader;
                        AutoFormatType = 1;
                    }
                    column(VATAmountLineVAT; VATAmountLine."VAT %")
                    {
                    }
                    column(AmountIncludingVATCaption; AmountIncludingVATCaptionLbl)
                    {
                    }
                    column(VATAmountCaption1; VATAmountCaption1Lbl)
                    {
                    }
                    column(VATBaseCaption; VATBaseCaptionLbl)
                    {
                    }
                    column(VATPercentCaption; VATPercentCaptionLbl)
                    {
                    }
                    column(VATAmountSpecificationCaption; VATAmountSpecificationCaptionLbl)
                    {
                    }
                    column(ContinuedCaption; ContinuedCaptionLbl)
                    {
                    }
                    column(TotalCaption; TotalCaptionLbl)
                    {
                    }
                    trigger OnAfterGetRecord()
                    begin
                        VATAmountLine.GetLine(Number);
                        VALVATBase := VATAmountLine."Amount Including VAT" / (1 + VATAmountLine."VAT %" / 100);
                        VALVATAmount := VATAmountLine."Amount Including VAT" - VALVATBase;
                    end;

                    trigger OnPreDataItem()
                    begin
                        if VATAmountLine.GetTotalVATAmount = 0 then CurrReport.Break();
                        SetRange(Number, 1, VATAmountLine.Count);
                        VALVATBase := 0;
                        VALVATAmount := 0;
                    end;
                }
                dataitem(VATClauseEntryCounter; "Integer")
                {
                    DataItemTableView = SORTING(Number);

                    column(VATClauseVATIdentifier; VATAmountLine."VAT Identifier")
                    {
                    }
                    column(VATClauseCode; VATAmountLine."VAT Clause Code")
                    {
                    }
                    column(VATClauseDescription; VATClause.Description)
                    {
                    }
                    column(VATClauseDescription2; VATClause."Description 2")
                    {
                    }
                    column(VATClauseAmount; VATAmountLine."VAT Amount")
                    {
                        AutoFormatExpression = "Issued Reminder Header"."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(VATClausesCaption; VATClausesCap)
                    {
                    }
                    column(VATClauseVATIdentifierCaption; VATIdentifierLbl)
                    {
                    }
                    column(VATClauseVATAmtCaption; VATAmountCaptionLbl)
                    {
                    }
                    trigger OnAfterGetRecord()
                    begin
                        VATAmountLine.GetLine(Number);
                        if not VATClause.Get(VATAmountLine."VAT Clause Code") then CurrReport.Skip();
                        VATClause.GetDescriptionText("Issued Reminder Header");
                    end;

                    trigger OnPreDataItem()
                    begin
                        Clear(VATClause);
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
                    column(VATAmtLineVAT1; VATAmountLine."VAT %")
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(VATAmountCaption2; VATAmountCaption2Lbl)
                    {
                    }
                    column(VATBase1Caption; VATBase1CaptionLbl)
                    {
                    }
                    column(VATPercentCaption1; VATPercentCaption1Lbl)
                    {
                    }
                    column(ContinuedCaption1; ContinuedCaption1Lbl)
                    {
                    }
                    trigger OnAfterGetRecord()
                    begin
                        VATAmountLine.GetLine(Number);
                        VALVATBaseLCY := Round(VATAmountLine."Amount Including VAT" / (1 + VATAmountLine."VAT %" / 100) / CurrFactor);
                        VALVATAmountLCY := Round(VATAmountLine."Amount Including VAT" / CurrFactor - VALVATBaseLCY);
                    end;

                    trigger OnPreDataItem()
                    begin
                        if (not GLSetup."Print VAT specification in LCY") or ("Issued Reminder Header"."Currency Code" = '') or (VATAmountLine.GetTotalVATAmount = 0) then CurrReport.Break();
                        SetRange(Number, 1, VATAmountLine.Count);
                        VALVATBaseLCY := 0;
                        VALVATAmountLCY := 0;
                        if GLSetup."LCY Code" = '' then
                            VALSpecLCYHeader := Text011 + Text012
                        else
                            VALSpecLCYHeader := Text011 + Format(GLSetup."LCY Code");
                        CurrExchRate.FindCurrency("Issued Reminder Header"."Posting Date", "Issued Reminder Header"."Currency Code", 1);
                        CustEntry.SetRange("Customer No.", "Issued Reminder Header"."Customer No.");
                        CustEntry.SetRange("Document Type", CustEntry."Document Type"::Reminder);
                        CustEntry.SetRange("Document No.", "Issued Reminder Header"."No.");
                        if CustEntry.FindFirst then begin
                            CustEntry.CalcFields("Amount (LCY)", Amount);
                            CurrFactor := 1 / (CustEntry."Amount (LCY)" / CustEntry.Amount);
                            VALExchRate := StrSubstNo(Text013, Round(1 / CurrFactor * 100, 0.000001), CurrExchRate."Exchange Rate Amount");
                        end
                        else begin
                            CurrFactor := CurrExchRate.ExchangeRate("Issued Reminder Header"."Posting Date", "Issued Reminder Header"."Currency Code");
                            VALExchRate := StrSubstNo(Text013, CurrExchRate."Relational Exch. Rate Amount", CurrExchRate."Exchange Rate Amount");
                        end;
                    end;
                }
                dataitem(LetterText; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));

                    column(GreetingText; GreetingLbl)
                    {
                    }
                    column(AmtDueText; AmtDueTxt)
                    {
                    }
                    column(BodyText; BodyLbl)
                    {
                    }
                    column(ClosingText; ClosingLbl)
                    {
                    }
                    column(DescriptionText; DescriptionLbl)
                    {
                    }
                    column(TotalRemAmt_IssuedReminderLine; TotalRemAmt)
                    {
                    }
                    column(FinalTotalInclVAT; NNC_TotalInclVAT)
                    {
                    }
                    column(TotalCaption1; TotalCaption1Lbl)
                    {
                    }
                    trigger OnPreDataItem()
                    begin
                        AmtDueTxt := '';
                        if Format("Issued Reminder Header"."Due Date") <> '' then AmtDueTxt := StrSubstNo(AmtDueLbl, "Issued Reminder Header"."Due Date");
                        OnLetterTextOnPreDataItemOnAfterSetAmtDueTxt("Issued Reminder Header", AmtDueTxt);
                    end;
                }
            }
            trigger OnAfterGetRecord()
            var
                GLAcc: Record "G/L Account";
                CustPostingGroup: Record "Customer Posting Group";
                VATPostingSetup: Record "VAT Posting Setup";
                issuereminHdr: Record "Issued Reminder Header";
            begin
                CustomerInfo.Get("Issued Reminder Header"."Customer No.");
                DivisionInfo.Get(CustomerInfo."Global Dimension 1 Code");
                DivisionInfo.CalcFields(Picture);
                DivisionAddr[1] := DivisionInfo.Name;
                DivisionAddr[2] := DivisionInfo.Address;
                DivisionAddr[3] := DivisionInfo."Address 2";
                DivisionAddr[4] := DivisionInfo."Global Dimension 1 Code";
                DivisionAddr[5] := DivisionInfo."Home Page";
                DivisionAddr[6] := DivisionInfo."E-Mail";
                DivisionAddr[7] := DivisionInfo."Dispatch E-Mail";
                DivisionAddr[8] := DivisionInfo."Company Name";
                DivisionAddr[9] := DivisionInfo."Legal Entity Name";
                DivisionAddr[10] := DivisionInfo."Colour Code";
                //DivisionAddr[11] := DivisionInfo.Picture;
                DivisionAddr[12] := DivisionInfo.City;
                DivisionAddr[13] := DivisionInfo."Post Code";
                DivisionAddr[14] := DivisionInfo."Country/Region Code";
                DivisionAddr[15] := DivisionInfo."Phone No.";
                DivisionAddr[16] := DivisionInfo."VAT Registration No.";
                DivisionAddr[17] := DivisionInfo."Bank Name";
                DivisionAddr[18] := DivisionInfo."Bank Branch No.";
                DivisionAddr[19] := DivisionInfo."Bank Account No.";
                DivisionAddr[20] := DivisionInfo."Registration No.";
                CurrReport.Language := Language_G.GetLanguageIdOrDefault("Language Code");
                DimSetEntry.SetRange("Dimension Set ID", "Dimension Set ID");
                FormatAddr.IssuedReminder(CustAddr, "Issued Reminder Header");
                if "Your Reference" = '' then
                    ReferenceText := ''
                else
                    ReferenceText := FieldCaption("Your Reference");
                if "Issued Reminder Header".GetCustomerVATRegistrationNumber = '' then
                    VATNoText := ''
                else
                    VATNoText := "Issued Reminder Header".GetCustomerVATRegistrationNumberLbl();
                if "Currency Code" = '' then begin
                    GLSetup.TestField("LCY Code");
                    TotalText := StrSubstNo(Text000, GLSetup."LCY Code");
                    TotalInclVATText := StrSubstNo(Text001, GLSetup."LCY Code");
                end
                else begin
                    TotalText := StrSubstNo(Text000, "Currency Code");
                    TotalInclVATText := StrSubstNo(Text001, "Currency Code");
                end;
                if not IsReportInPreviewMode then IncrNoPrinted;
                Customer.GetPrimaryContact("Customer No.", PrimaryContact);
                CalcFields("Additional Fee");
                CustPostingGroup.Get("Customer Posting Group");
                if GLAcc.Get(CustPostingGroup."Additional Fee Account") then begin
                    VATPostingSetup.Get("VAT Bus. Posting Group", GLAcc."VAT Prod. Posting Group");
                    AddFeeInclVAT := "Additional Fee" * (1 + VATPostingSetup."VAT %" / 100);
                end
                else
                    AddFeeInclVAT := "Additional Fee";
                CalcFields("Add. Fee per Line");
                AddFeePerLineInclVAT := "Add. Fee per Line" + CalculateLineFeeVATAmount;
                CalcFields("Interest Amount", "VAT Amount");
                if ("Interest Amount" <> 0) and ("VAT Amount" <> 0) then begin
                    GLAcc.Get(CustPostingGroup."Interest Account");
                    VATPostingSetup.Get("VAT Bus. Posting Group", GLAcc."VAT Prod. Posting Group");
                    VATInterest := VATPostingSetup."VAT %";
                    Interest := ("Interest Amount" + "VAT Amount" + "Additional Fee" - AddFeeInclVAT + "Add. Fee per Line" - AddFeePerLineInclVAT) / (VATInterest / 100 + 1);
                end
                else begin
                    Interest := "Interest Amount";
                    VATInterest := 0;
                end;
                TotalVATAmount := "VAT Amount";
                NNC_InterestAmountTotal := 0;
                NNC_RemainingAmountTotal := 0;
                NNC_VATAmountTotal := 0;
                NNC_InterestAmount := 0;
                NNC_Total := 0;
                NNC_VATAmount := 0;
                NNC_TotalInclVAT := 0;
                TotalRemAmt := 0;
                ReminderLavelCP := '';
                ReminderLavelCP := GetCaption();
            end;

            trigger OnPreDataItem()
            begin
                CompanyInfo.Get();
                FormatAddr.Company(CompanyAddr, CompanyInfo);
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

                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies if you want the printed report to show information that is only for internal use.';
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if you want the reminder that you print to be recorded as interaction, and to be added to the Interaction Log Entry table.';
                    }
                    field(ShowNotDueAmounts; ShowNotDueAmounts)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Not Due Amounts';
                        ToolTip = 'Specifies if you want to show amounts that are not due from customers.';
                    }
                    field(ShowMIR; ShowMIRLines)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show MIR Detail';
                        ToolTip = 'Specifies if you want multiple interest rate details for the journal lines to be included in the report.';
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
        end;

        trigger OnOpenPage()
        var
            DocumentType: Enum "Interaction Log Entry Document Type";
        begin
            //LogInteraction := SegManagement.FindInteractTmplCode(8) <> '';
            LogInteraction := SegManagement.FindInteractionTemplateCode(DocumentType::"Sales Rmdr.") <> '';
            LogInteractionEnable := LogInteraction;
        end;
    }
    labels
    {
    }
    trigger OnInitReport()
    begin
        GLSetup.Get();
        SalesSetup.Get();
        case SalesSetup."Logo Position on Documents" of
            SalesSetup."Logo Position on Documents"::"No Logo":
                ;
            SalesSetup."Logo Position on Documents"::Left:
                begin
                    CompanyInfo3.Get();
                    CompanyInfo3.CalcFields(Picture);
                end;
            SalesSetup."Logo Position on Documents"::Center:
                begin
                    CompanyInfo1.Get();
                    CompanyInfo1.CalcFields(Picture);
                end;
            SalesSetup."Logo Position on Documents"::Right:
                begin
                    CompanyInfo2.Get();
                    CompanyInfo2.CalcFields(Picture);
                end;
        end;
    end;

    trigger OnPostReport()
    begin
        if LogInteraction and not IsReportInPreviewMode then
            if "Issued Reminder Header".FindSet then
                repeat
                    SegManagement.LogDocument(8, "Issued Reminder Header"."No.", 0, 0, DATABASE::Customer, "Issued Reminder Header"."Customer No.", '', '', "Issued Reminder Header"."Posting Description", '');
                until "Issued Reminder Header".Next() = 0;
    end;

    var
        DivisionInfo: Record "Division";
        DivisionAddr: array[20] of Text[100];
        CustomerInfo: Record Customer;
        Text000: Label 'Total %1';
        Text001: Label 'Total %1 Incl. VAT';
        PrimaryContact: Record Contact;
        Customer: Record Customer;
        CustEntry: Record "Cust. Ledger Entry";
        GLSetup: Record "General Ledger Setup";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        CompanyInfo: Record "Company Information";
        VATAmountLine: Record "VAT Amount Line" temporary;
        VATClause: Record "VAT Clause";
        DimSetEntry: Record "Dimension Set Entry";
        CurrExchRate: Record "Currency Exchange Rate";
        Language_G: Codeunit Language;
        FormatAddr: Codeunit "Format Address";
        SegManagement: Codeunit SegManagement;
        CustAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        VATNoText: Text[30];
        ReferenceText: Text[35];
        TotalText: Text[50];
        TotalInclVATText: Text[50];
        ReminderInterestAmount: Decimal;
        EndLineNo: Integer;
        Continue: Boolean;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        LogInteraction: Boolean;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        VALExchRate: Text[50];
        CurrFactor: Decimal;
        description_L: Text;//ds
        Text011: Label 'VAT Amount Specification in ';
        Text012: Label 'Local Currency';
        Text013: Label 'Exchange rate: %1/%2';
        AddFeeInclVAT: Decimal;
        AddFeePerLineInclVAT: Decimal;
        TotalVATAmount: Decimal;
        VATInterest: Decimal;
        VALVATBase: Decimal;
        VALVATAmount: Decimal;
        Interest: Decimal;
        NNC_InterestAmount: Decimal;
        NNC_Total: Decimal;
        NNC_VATAmount: Decimal;
        NNC_TotalInclVAT: Decimal;
        NNC_InterestAmountTotal: Decimal;
        NNC_RemainingAmountTotal: Decimal;
        NNC_VATAmountTotal: Decimal;
        TotalRemIntAmount: Decimal;
        LogInteractionEnable: Boolean;
        ShowNotDueAmounts: Boolean;
        DueDateCaptionLbl: Label 'Due Date';
        DocumentDateCaptionLbl: Label 'Document Date';
        PageCaptionLbl: Label 'Page';
        PostingDateCaptionLbl: Label 'Posting Date';
        ReminderNoCaptionLbl: Label 'Reminder No.';
        BankAccountNoCaptionLbl: Label 'Account No.';
        BankNameCaptionLbl: Label 'Bank';
        EmailCaptionLbl: Label 'E-Mail';
        HomePageCaptionLbl: Label 'Home Page';
        PhoneNoCaptionLbl: Label 'Phone No.';
        ReminderCaptionLbl: Label 'Reminder';
        BankBranchNoCaptionLbl: Label 'Bank Branch No.';
        HeaderDimensionsCaptionLbl: Label 'Header Dimensions';
        InterestAmountCaptionLbl: Label 'Interest Amount';
        VATAmountCaptionLbl: Label 'VAT Amount';
        AmountIncludingVATCaptionLbl: Label 'Amount Including VAT';
        VATAmountCaption1Lbl: Label 'VAT Amount';
        VATClausesCap: Label 'VAT Clause';
        VATIdentifierLbl: Label 'VAT Identifier';
        VATBaseCaptionLbl: Label 'VAT Base';
        VATPercentCaptionLbl: Label 'VAT %';
        VATAmountSpecificationCaptionLbl: Label 'VAT Amount Specification';
        ContinuedCaptionLbl: Label 'Continued';
        TotalCaptionLbl: Label 'Total';
        GreetingLbl: Label 'Hello';
        AmtDueLbl: Label 'You are receiving this email to formally notify you that payment owed by you is past due. The payment was due on %1. Enclosed is a copy of invoice with the details of remaining amount.', Comment = '%1 = A due date';
        BodyLbl: Label 'If you have already made the payment, please disregard this email. Thank you for your business.';
        ClosingLbl: Label 'Sincerely';
        DescriptionLbl: Label 'Description';
        ContactPhoneNoLbl: Label 'Contact Phone No.';
        ContactMobilePhoneNoLbl: Label 'Contact Mobile Phone No.';
        ContactEmailLbl: Label 'Contact E-Mail';
        AmtDueTxt: Text;
        RemainingAmt: Text;
        TotalRemAmt: Decimal;
        ShowMIRLines: Boolean;
        VATAmountCaption2Lbl: Label 'VAT Amount';
        VATBase1CaptionLbl: Label 'VAT Base';
        VATPercentCaption1Lbl: Label 'VAT %';
        ContinuedCaption1Lbl: Label 'Continued';
        TotalCaption1Lbl: Label 'Total';
        ReminderLavelCP: Text;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnLetterTextOnPreDataItemOnAfterSetAmtDueTxt(var IssuedReminderHeader: Record "Issued Reminder Header";
    var AmtDueTxt: Text)
    begin
    end;

    local procedure GetCaption(): Text
    var
        CaptionALbl: Label 'Reminder';
        CaptionBLbl: Label '2nd Reminder';
        CaptionCLbl: Label 'Final Notice';
        CapText: Text;
    begin
        CapText := '';
        if "Issued Reminder Header"."Reminder Level" = 1 then begin
            CapText := CaptionALbl;
        end;

        if "Issued Reminder Header"."Reminder Level" = 2 then begin
            CapText := CaptionBLbl;
        end;

        if "Issued Reminder Header"."Reminder Level" = 3 then begin
            CapText := CaptionCLbl;
        end;
        exit(CapText);
    end;
}
