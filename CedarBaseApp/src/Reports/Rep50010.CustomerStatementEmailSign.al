report 50010 "CustomerStatementEmailSign"
{
    DefaultLayout = Word;
    WordLayout = './layout/EmailSignature.docx';
    Caption = 'Customer Statement Email Signature';

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = SORTING("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Search Name", "Print Statements", "Currency Filter";
            column(No_Cust; "No.")
            {
            }

            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                PrintOnlyIfDetail = true;
                column(CompanyInfo1Picture; CompanyInfo1.Picture)
                {
                }
                column(CompanyInfo2Picture; CompanyInfo2.Picture)
                {
                }
                column(CompanyInfo3Picture; CompanyInfo3.Picture)
                {
                }
                column(TemporaryPicture; Division.Picture)
                {

                }
                column(Division_LegalEntityName; Division."Legal Entity Name")
                {
                }
                column(DivisionAddr1; Division.Address)
                {
                }
                column(DivisionAddr2; Division."Address 2")
                {
                }
                column(DivisionCity; Division.City)
                {
                }
                column(DivisionpostCode; Division."Post Code")
                {
                }
                column(DivisionRegionCode; Division."Country/Region Code")
                {
                }
                column(DivisionHomePage; Division."Home Page")
                {
                }
                column(DivisionEmail; Division."E-Mail")
                {
                }
                column(DivisionName; Division.Name)
                {
                }
                column(DivisionCompRegNo; Division."Registration No.")
                {
                }
                column(DivisionVATRegistrationNo; Division."VAT Registration No.")
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
                column(DivisionPhoneNo; Division."Phone No.")
                {
                }
                column(CustAddr1; CustAddr[1])
                {
                }
                column(CompanyAddr1; CompanyAddr[1])
                {
                }
                column(CustAddr2; CustAddr[2])
                {
                }
                column(CompanyAddr2; CompanyAddr[2])
                {
                }
                column(CustAddr3; CustAddr[3])
                {
                }
                column(CompanyAddr3; CompanyAddr[3])
                {
                }
                column(CustAddr4; CustAddr[4])
                {
                }
                column(CompanyAddr4; CompanyAddr[4])
                {
                }
                column(CustAddr5; CustAddr[5])
                {
                }
                column(PhoneNo_CompanyInfo; CompanyInfo."Phone No.")
                {
                }
                column(CustAddr6; CustAddr[6])
                {
                }
                column(CompanyInfoEmail; CompanyInfo."E-Mail")
                {
                }
                column(CompanyInfoHomePage; CompanyInfo."Home Page")
                {
                }
                column(VATRegNo_CompanyInfo; CompanyInfo."VAT Registration No.")
                {
                }
                column(GiroNo_CompanyInfo; CompanyInfo."Giro No.")
                {
                }
                column(BankName_CompanyInfo; CompanyInfo."Bank Name")
                {
                }
                column(BankAccNo_CompanyInfo; CompanyInfo."Bank Account No.")
                {
                }
                column(No1_Cust; Customer."No.")
                {
                }
                column(TodayFormatted; Format(Today))
                {
                }
                column(StartDate; Format(StartDate))
                {
                }
                column(EndDate; Format(EndDate))
                {
                }
                column(LastStatmntNo_Cust; Format(Customer."Last Statement No."))
                {
                }
                column(CustAddr7; CustAddr[7])
                {
                }
                column(CustAddr8; CustAddr[8])
                {
                }
                column(CompanyAddr7; CompanyAddr[7])
                {
                }
                column(CompanyAddr8; CompanyAddr[8])
                {
                }
                column(StatementCaption; StatementCaptionLbl)
                {
                }
                column(PhoneNo_CompanyInfoCaption; PhoneNo_CompanyInfoCaptionLbl)
                {
                }
                column(VATRegNo_CompanyInfoCaption; VATRegNo_CompanyInfoCaptionLbl)
                {
                }
                column(GiroNo_CompanyInfoCaption; GiroNo_CompanyInfoCaptionLbl)
                {
                }
                column(BankName_CompanyInfoCaption; BankName_CompanyInfoCaptionLbl)
                {
                }
                column(BankAccNo_CompanyInfoCaption; BankAccNo_CompanyInfoCaptionLbl)
                {
                }
                column(No1_CustCaption; No1_CustCaptionLbl)
                {
                }
                column(StartDateCaption; StartDateCaptionLbl)
                {
                }
                column(EndDateCaption; EndDateCaptionLbl)
                {
                }
                column(LastStatmntNo_CustCaption; LastStatmntNo_CustCaptionLbl)
                {
                }
                column(PostDate_DtldCustLedgEntriesCaption; PostDate_DtldCustLedgEntriesCaptionLbl)
                {
                }
                column(DocNo_DtldCustLedgEntriesCaption; "Detailed Cust. Ledg. Entry".FieldCaption("Document No."))
                {
                }
                column(Desc_CustLedgEntry2Caption; CustLedgEntry2.FieldCaption(Description))
                {
                }
                column(DueDate_CustLedgEntry2Caption; DueDate_CustLedgEntry2CaptionLbl)
                {
                }
                column(RemainAmtCustLedgEntry2Caption; CustLedgEntry2.FieldCaption("Remaining Amount"))
                {
                }
                column(CustBalanceCaption; CustBalanceCaptionLbl)
                {
                }
                column(OriginalAmt_CustLedgEntry2Caption; CustLedgEntry2.FieldCaption("Original Amount"))
                {
                }
                column(CompanyInfoHomepageCaption; CompanyInfoHomepageCaptionLbl)
                {
                }
                column(CompanyInfoEmailCaption; CompanyInfoEmailCaptionLbl)
                {
                }
                column(DocDateCaption; DocDateCaptionLbl)
                {
                }
                column(Total_Caption2; Total_CaptionLbl)
                {
                }
                column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
                {
                }
                dataitem(CurrencyLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1));
                    PrintOnlyIfDetail = true;
                    dataitem(CustLedgEntryHdr; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(Currency2Code_CustLedgEntryHdr; StrSubstNo(Text001Lbl, CurrencyCode3))
                        {
                        }
                        column(StartBalance; StartBalance)
                        {
                            AutoFormatExpression = TempCurrency2.Code;
                            AutoFormatType = 1;
                        }
                        column(CurrencyCode3; CurrencyCode3)
                        {
                        }
                        column(CustBalance_CustLedgEntryHdr; CustBalance)
                        {
                        }
                        column(PrintLine; PrintLine)
                        {
                        }
                        column(DtldCustLedgEntryType; Format("Detailed Cust. Ledg. Entry"."Entry Type", 0, 2))
                        {
                        }
                        column(EntriesExists; EntriesExists)
                        {
                        }
                        column(IsNewCustCurrencyGroup; IsNewCustCurrencyGroup)
                        {
                        }
                        dataitem("Detailed Cust. Ledg. Entry"; "Detailed Cust. Ledg. Entry")
                        {
                            DataItemTableView = SORTING("Customer No.", "Posting Date", "Entry Type", "Currency Code");
                            MaxIteration = 1;
                            column(PostDate_DtldCustLedgEntries; Format("Posting Date"))
                            {
                            }
                            column(DocNo_DtldCustLedgEntries; "Document No.")
                            {
                            }
                            column(Description; Description)
                            {
                            }
                            column(DueDate_DtldCustLedgEntries; Format(DueDate))
                            {
                            }
                            column(CurrCode_DtldCustLedgEntries; "Currency Code")
                            {
                            }
                            column(Amt_DtldCustLedgEntries; Amount)
                            {
                                AutoFormatExpression = "Currency Code";
                                AutoFormatType = 1;
                            }
                            column(RemainAmt_DtldCustLedgEntries; RemainingAmount)
                            {
                                AutoFormatExpression = "Currency Code";
                                AutoFormatType = 1;
                            }
                            column(CustBalance; CustBalance)
                            {
                                AutoFormatExpression = "Currency Code";
                                AutoFormatType = 1;
                            }
                            column(Currency2Code; TempCurrency2.Code)
                            {
                            }

                            trigger OnAfterGetRecord()
                            var
                                CustLedgerEntry: Record "Cust. Ledger Entry";
                            begin

                            end;

                            trigger OnPreDataItem()
                            begin

                            end;
                        }
                    }
                    dataitem(CustLedgEntryFooter; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(CurrencyCode3_CustLedgEntryFooter; CurrencyCode3)
                        {
                        }
                        column(Total_Caption; Total_CaptionLbl)
                        {
                        }
                        column(CustBalance_CustLedgEntryHdrFooter; CustBalance)
                        {
                            AutoFormatExpression = TempCurrency2.Code;
                            AutoFormatType = 1;
                        }
                        column(EntriesExistsl_CustLedgEntryFooterCaption; EntriesExists)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            ClearCompanyPicture;
                        end;
                    }
                    dataitem(CustLedgEntry2; "Cust. Ledger Entry")
                    {
                        DataItemLink = "Customer No." = FIELD("No.");
                        DataItemLinkReference = Customer;
                        DataItemTableView = SORTING("Customer No.", Open, Positive, "Due Date");
                        MaxIteration = 1;
                        column(OverDueEntries; StrSubstNo(Text002Lbl, TempCurrency2.Code))
                        {
                        }
                        column(RemainAmt_CustLedgEntry2; "Remaining Amount")
                        {
                            AutoFormatExpression = "Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PostDate_CustLedgEntry2; Format("Posting Date"))
                        {
                        }
                        column(DocNo_CustLedgEntry2; "Document No.")
                        {
                        }
                        column(Desc_CustLedgEntry2; Description)
                        {
                        }
                        column(DueDate_CustLedgEntry2; Format("Due Date"))
                        {
                        }
                        column(OriginalAmt_CustLedgEntry2; "Original Amount")
                        {
                            AutoFormatExpression = "Currency Code";
                        }
                        column(CurrCode_CustLedgEntry2; "Currency Code")
                        {
                        }
                        column(PrintEntriesDue; PrintEntriesDue)
                        {
                        }
                        column(Currency2Code_CustLedgEntry2; TempCurrency2.Code)
                        {
                        }
                        column(CurrencyCode3_CustLedgEntry2; CurrencyCode3)
                        {
                        }
                        column(CustNo_CustLedgEntry2; "Customer No.")
                        {
                        }

                        trigger OnAfterGetRecord()
                        var
                            CustLedgEntry: Record "Cust. Ledger Entry";
                        begin


                        end;

                        trigger OnPreDataItem()
                        begin

                        end;
                    }

                    trigger OnAfterGetRecord()
                    var
                        CustLedgerEntry: Record "Cust. Ledger Entry";
                    begin



                    end;

                    trigger OnPreDataItem()
                    begin

                    end;
                }
                dataitem(AgingBandLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1));


                    trigger OnAfterGetRecord()
                    begin

                    end;

                    trigger OnPreDataItem()
                    begin

                    end;
                }
            }

            trigger OnAfterGetRecord()
            var
                CustLedgerEntry: Record "Cust. Ledger Entry";
                GenLedgerSetup: Record "General Ledger Setup";

            begin


                FormatAddr.Customer(CustAddr, Customer);
                PrintedCustomersList.Add("No.");

                IsFirstLoop := false;

                BodyText2 := StrSubstNo(BodyTextOrderConf2, CompanyInfo.Address);
                BodyText3 := BodyTextOrderConf3;
                BodyText4 := BodyTextOrderConf4;

                GenLedgerSetup.Get();
                if Division.Get(Customer."Global Dimension 1 Code") then
                    Division.CalcFields(Picture);


                IF Customer."Global Dimension 1 Code" <> Division.Code then begin
                    Error('Customer Default Dimension %1 Does Not Match With Document Default Dimension %2', Customer."Global Dimension 1 Code", Division.Code);
                end;
            end;

            trigger OnPreDataItem()
            var
                CustLedgerEntry: Record "Cust. Ledger Entry";
            begin



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
                    field("Start Date"; StartDate)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Start Date';
                        ToolTip = 'Specifies the date from which the report or batch job processes information.';
                    }
                    field("End Date"; EndDate)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'End Date';
                        ToolTip = 'Specifies the date to which the report or batch job processes information.';
                    }
                    field(ShowOverdueEntries; PrintEntriesDue)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Overdue Entries';
                        ToolTip = 'Specifies if you want overdue entries to be shown separately for each currency.';
                    }
                    group(Include)
                    {
                        Caption = 'Include';
                        field(IncludeAllCustomerswithLE; PrintAllHavingEntry)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Include All Customers with Ledger Entries';
                            MultiLine = true;
                            ToolTip = 'Specifies if you want entries displayed for customers that have ledger entries at the end of the selected period.';

                            trigger OnValidate()
                            begin
                                if not PrintAllHavingEntry then
                                    PrintAllHavingBal := true;
                            end;
                        }
                        field(IncludeAllCustomerswithBalance; PrintAllHavingBal)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Include All Customers with a Balance';
                            MultiLine = true;
                            ToolTip = 'Specifies if you want entries displayed for customers that have a balance.';

                            trigger OnValidate()
                            begin
                                if not PrintAllHavingBal then
                                    PrintAllHavingEntry := true;
                            end;
                        }
                        field(IncludeReversedEntries; PrintReversedEntries)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Include Reversed Entries';
                            ToolTip = 'Specifies if you want to include reversed entries in the report.';
                        }
                        field(IncludeUnappliedEntries; PrintUnappliedEntries)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Include Unapplied Entries';
                            ToolTip = 'Specifies if you want to include unapplied entries in the report.';
                        }
                    }
                    group("Aging Band")
                    {
                        Caption = 'Aging Band';
                        field(IncludeAgingBand; IncludeAgingBand)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Include Aging Band';
                            ToolTip = 'Specifies if you want an aging band to be included in the document. If you place a check mark here, you must also fill in the Aging Band Period Length and Aging Band by fields.';
                        }
                        field(AgingBandPeriodLengt; PeriodLength)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Aging Band Period Length';
                            ToolTip = 'Specifies the length of each of the four periods in the aging band, for example, enter "1M" for one month. The most recent period will end on the last day of the period in the Date Filter field.';
                        }
                        field(AgingBandby; DateChoice)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Aging Band by';
                            OptionCaption = 'Due Date,Posting Date';
                            ToolTip = 'Specifies if the aging band will be calculated from the due date or from the posting date.';
                        }
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies that interactions with the contact are logged.';
                    }
                }
                group("Output Options")
                {
                    Caption = 'Output Options';
                    field(ReportOutput; SupportedOutputMethod)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Report Output';
                        OptionCaption = 'Print,Preview,PDF,Email,Excel,XML';
                        ToolTip = 'Specifies the output of the scheduled report, such as PDF or Word.';

                        trigger OnValidate()
                        var
                            CustomLayoutReporting: Codeunit "Custom Layout Reporting";
                        begin
                            ShowPrintIfEmailIsMissing := (SupportedOutputMethod = SupportedOutputMethod::Email);

                            case SupportedOutputMethod of
                                SupportedOutputMethod::Print:
                                    ChosenOutputMethod := CustomLayoutReporting.GetPrintOption;
                                SupportedOutputMethod::Preview:
                                    ChosenOutputMethod := CustomLayoutReporting.GetPreviewOption;
                                SupportedOutputMethod::PDF:
                                    ChosenOutputMethod := CustomLayoutReporting.GetPDFOption;
                                SupportedOutputMethod::Email:
                                    ChosenOutputMethod := CustomLayoutReporting.GetEmailOption;
                                SupportedOutputMethod::Excel:
                                    ChosenOutputMethod := CustomLayoutReporting.GetExcelOption;
                                SupportedOutputMethod::XML:
                                    ChosenOutputMethod := CustomLayoutReporting.GetXMLOption;
                            end;
                        end;
                    }
                    field(ChosenOutput; ChosenOutputMethod)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Chosen Output';
                        ToolTip = 'Specifies how to output the report, such as Print or Excel.';
                        Visible = false;
                    }
                    group(EmailOptions)
                    {
                        Caption = 'Email Options';
                        Visible = ShowPrintIfEmailIsMissing;
                        field(PrintMissingAddresses; PrintIfEmailIsMissing)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Print Although Email is Missing';
                            ToolTip = 'Specifies if you want to print also the statements for customers that have not been set up with a send-to email address.';
                        }
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            InitRequestPageDataInternal;
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
                    CompanyInfo1.Get();
                    CompanyInfo1.CalcFields(Picture);
                end;
            SalesSetup."Logo Position on Documents"::Center:
                begin
                    CompanyInfo2.Get();
                    CompanyInfo2.CalcFields(Picture);
                end;
            SalesSetup."Logo Position on Documents"::Right:
                begin
                    CompanyInfo3.Get();
                    CompanyInfo3.CalcFields(Picture);
                end;
        end;

        LogInteractionEnable := true;
    end;

    trigger OnPostReport()
    var
        CusNo: Code[20];
    begin
        CompanyInfo.get();
        if not IsReportInPreviewMode then
            foreach CusNo in PrintedCustomersList do
                if Customer.Get(CusNo) then begin
                    Customer."Last Statement No." := Customer."Last Statement No." + 1;
                    Customer.Modify();
                    if LogInteraction then
                        SegManagement.LogDocument(
                          7, Format(Customer."Last Statement No."), 0, 0, DATABASE::Customer, Customer."No.", Customer."Salesperson Code", '',
                          Text003Txt + Format(Customer."Last Statement No."), '');
                end;
    end;

    trigger OnPreReport()
    begin
        InitRequestPageDataInternal;
    end;

    var
        Text001Lbl: Label 'Entries %1', Comment = '%1 is the currency code';
        Text002Lbl: Label 'Overdue Entries %1', Comment = '%1 is the currency code';
        Text003Txt: Label 'Statement ';
        GLSetup: Record "General Ledger Setup";
        SalesSetup: Record "Sales & Receivables Setup";
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        Cust2: Record Customer;
        TempCurrency2: Record Currency temporary;
        DetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        TempAgingBandBuf: Record "Aging Band Buffer" temporary;
        FormatAddr: Codeunit "Format Address";
        SegManagement: Codeunit SegManagement;
        PrintedCustomersList: List of [Code[20]];
        PrintAllHavingEntry: Boolean;
        PrintAllHavingBal: Boolean;
        PrintEntriesDue: Boolean;
        PrintUnappliedEntries: Boolean;
        PrintReversedEntries: Boolean;
        PrintLine: Boolean;
        LogInteraction: Boolean;
        EntriesExists: Boolean;
        StartDate: Date;
        EndDate: Date;
        DueDate: Date;
        CustAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        Description: Text[100];
        StartBalance: Decimal;
        CustBalance: Decimal;
        RemainingAmount: Decimal;
        CurrencyCode3: Code[10];
        Text005Txt: Label 'Multicurrency Application';
        Text006Txt: Label 'Payment Discount';
        Text007Txt: Label 'Rounding';
        PeriodLength: DateFormula;
        PeriodLength2: DateFormula;
        DateChoice: Option "Due Date","Posting Date";
        AgingDate: array[5] of Date;
        Text008Err: Label 'You must specify the Aging Band Period Length.';
        AgingBandEndingDate: Date;
        Text010Err: Label 'You must specify Aging Band Ending Date.';
        Text011Lbl: Label 'Aged Summary by %1 (%2 by %3)', Comment = '%1 is ending date, %2 is period length, %3 is Due Date or Posting Date';
        IncludeAgingBand: Boolean;
        Text012Err: Label 'Period Length is out of range.';
        AgingBandCurrencyCode: Code[20];
        Text013Txt: Label 'Due Date,Posting Date';
        Text014Txt: Label 'Application Writeoffs';
        LogInteractionEnable: Boolean;
        Text036Txt: Label '-%1', Comment = 'Negating the period length: %1 is the period length';
        StatementCaptionLbl: Label 'Statement';
        PhoneNo_CompanyInfoCaptionLbl: Label 'Phone No.';
        VATRegNo_CompanyInfoCaptionLbl: Label 'VAT Registration No.';
        GiroNo_CompanyInfoCaptionLbl: Label 'Giro No.';
        BankName_CompanyInfoCaptionLbl: Label 'Bank';
        BankAccNo_CompanyInfoCaptionLbl: Label 'Account No.';
        No1_CustCaptionLbl: Label 'Customer No.';
        StartDateCaptionLbl: Label 'Starting Date';
        EndDateCaptionLbl: Label 'Ending Date';
        LastStatmntNo_CustCaptionLbl: Label 'Statement No.';
        PostDate_DtldCustLedgEntriesCaptionLbl: Label 'Posting Date';
        DueDate_CustLedgEntry2CaptionLbl: Label 'Due Date';
        CustBalanceCaptionLbl: Label 'Running Total';
        beforeCaptionLbl: Label '..before';
        isInitialized: Boolean;
        CompanyInfoHomepageCaptionLbl: Label 'Home Page';
        CompanyInfoEmailCaptionLbl: Label 'Email';
        DocDateCaptionLbl: Label 'Document Date';
        Total_CaptionLbl: Label 'Total';
        BlankStartDateErr: Label 'Start Date must have a value.';
        BlankEndDateErr: Label 'End Date must have a value.';
        StartDateLaterTheEndDateErr: Label 'Start date must be earlier than End date.';
        IsFirstLoop: Boolean;
        CurrReportPageNoCaptionLbl: Label 'Page';
        IsFirstPrintLine: Boolean;
        IsNewCustCurrencyGroup: Boolean;
        SupportedOutputMethod: Option Print,Preview,PDF,Email,Excel,XML;
        ChosenOutputMethod: Integer;
        PrintIfEmailIsMissing: Boolean;
        ShowPrintIfEmailIsMissing: Boolean;
        FirstCustomerPrinted: Boolean;
        DivisionColor: Text[30];
        Division: Record Division;
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

    local procedure GetDate(PostingDate: Date; DueDate: Date): Date
    begin
        if DateChoice = DateChoice::"Posting Date" then
            exit(PostingDate);

        exit(DueDate);
    end;





    procedure InitializeRequest(NewPrintEntriesDue: Boolean; NewPrintAllHavingEntry: Boolean; NewPrintAllHavingBal: Boolean; NewPrintReversedEntries: Boolean; NewPrintUnappliedEntries: Boolean; NewIncludeAgingBand: Boolean; NewPeriodLength: Text[30]; NewDateChoice: Option; NewLogInteraction: Boolean; NewStartDate: Date; NewEndDate: Date)
    begin
        InitRequestPageDataInternal;

        PrintEntriesDue := NewPrintEntriesDue;
        PrintAllHavingEntry := NewPrintAllHavingEntry;
        PrintAllHavingBal := NewPrintAllHavingBal;
        PrintReversedEntries := NewPrintReversedEntries;
        PrintUnappliedEntries := NewPrintUnappliedEntries;
        IncludeAgingBand := NewIncludeAgingBand;
        Evaluate(PeriodLength, NewPeriodLength);
        DateChoice := NewDateChoice;
        LogInteraction := NewLogInteraction;
        StartDate := NewStartDate;
        EndDate := NewEndDate;
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody);
    end;

    procedure InitRequestPageDataInternal()
    var
        DocumentType: Enum "Interaction Log Entry Document Type";
    begin
        if isInitialized then
            exit;

        isInitialized := true;

        if (not PrintAllHavingEntry) and (not PrintAllHavingBal) then
            PrintAllHavingBal := true;

        //LogInteraction := SegManagement.FindInteractTmplCode(7) <> '';
        LogInteraction := SegManagement.FindInteractionTemplateCode(DocumentType::"Sales Stmnt.") <> '';
        LogInteractionEnable := LogInteraction;

        if Format(PeriodLength) = '' then
            Evaluate(PeriodLength, '<1M+CM>');

        PrintIfEmailIsMissing := SupportedOutputMethod = SupportedOutputMethod::Email;
    end;

    local procedure VerifyDates()
    begin
        // if StartDate = 0D then
        //     Error(BlankStartDateErr);
        // if EndDate = 0D then
        //     Error(BlankEndDateErr);
        // if StartDate > EndDate then
        //     Error(StartDateLaterTheEndDateErr);
    end;

    local procedure ClearCompanyPicture()
    begin
        if FirstCustomerPrinted then begin
            Clear(CompanyInfo.Picture);
            Clear(CompanyInfo1.Picture);
            Clear(CompanyInfo2.Picture);
            Clear(CompanyInfo3.Picture);
        end;
        FirstCustomerPrinted := true;
    end;
}

