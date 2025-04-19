tableextension 50002 "Customer Ext" extends Customer
{

    fields
    {
        field(50000; "Carriage %"; Decimal)
        {
            Caption = 'Carriage %';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if ("Carriage %" > 100) then
                    Error('Carriage Percentage cannot be more than 100');
                if ("Carriage %" < 0) then
                    Error('Carriage Percentage cannot be less than 0');

            end;
        }

        field(50001; "No of employee"; Option)
        {
            OptionMembers = "1 to 25 Employees","26 to 50 Employees","51 to 75 Employees","76 to 100 Employees","100+ Employees";

        }
        field(50002; "Customer Industry"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(50003; "Hide Price"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70000; "Contact Phone No."; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Contact Phone No'; //NS 
            Editable = false;
        }
        field(70001; "Contact E-Mail"; Code[80])
        {
            DataClassification = ToBeClassified;
            Caption = 'Contact Email Address';
            Editable = false;
            ObsoleteState = Removed;
        }
        field(70002; "Contact Home Address"; Code[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Contact Home Address';
            Editable = false;
            ObsoleteState = Removed;

        }
        field(70003; "Salutation Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Salutation Code';
            Editable = false;


        }
        field(70004; "No. of BSO Open"; Integer)
        {

            Caption = 'No. of Blanket Sales Order Open';
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST("Blanket Order"),
                                                      "Sell-to Customer No." = FIELD("No."), Status = const(Open), Cancelled = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70005; "No. of BSO Released"; Integer)
        {
            Caption = 'No. of Blanket Sales Order Released';
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST("Blanket Order"),
                                                      "Sell-to Customer No." = FIELD("No."), Status = const(Released), Cancelled = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70006; "Contact County"; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
            Editable = false;
        }
        field(70007; "Salutation Description"; Text[100])
        {
            Caption = 'Salutation Code';
            Editable = false;
        }
        field(70008; "Contact Mobile Phone No."; Text[30])
        {
            Caption = 'Mobile Phone No.';
            ExtendedDatatype = PhoneNo;
            Editable = false;

        }
        field(70009; "Contact E-Mail SMDX"; Text[80])
        {
            DataClassification = ToBeClassified;
            Caption = 'Contact Email Address';
            Editable = false;
        }
        field(70010; "Contact Home Address SMDX"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Contact Home Address';
            Editable = false;
        }
        field(70011; "Contact Post Code"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Post Code';
            Editable = false;
        }
        field(70012; Favourite; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Favourite';
        }

        modify("E-Mail")
        {
            trigger OnAfterValidate()
            var
                CustReportSelection: Record "Custom Report Selection";
            begin
                CustReportSelection.Reset();
                CustReportSelection.SetRange("Source Type", 18);
                CustReportSelection.SetRange("Source No.", Rec."No.");
                if CustReportSelection.FindSet() then
                    repeat
                        CustReportSelection."Send To Email" := Rec."E-Mail";
                        CustReportSelection.Modify();
                    until CustReportSelection.Next() = 0;
            end;
        }

        modify("Primary Contact No.")
        {
            trigger OnAfterValidate()
            var
                ContactRec: Record Contact;
                Salutation: Record Salutation;
            begin
                if ContactRec.Get("Primary Contact No.") then begin
                    ClearVariable();
                    Rec."Contact Phone No." := ContactRec."Phone No.";
                    Rec."Contact E-Mail SMDX" := ContactRec."E-Mail";
                    Rec."Contact Home Address SMDX" := ContactRec.Address;
                    if Salutation.Get(ContactRec."Salutation Code") then
                        Rec."Salutation Description" := Salutation.Description;
                    Rec."Contact County" := ContactRec.County;
                    Rec."Contact Mobile Phone No." := ContactRec."Mobile Phone No.";
                    Rec."Contact Post Code" := ContactRec."Post Code";
                end else begin
                    ClearVariable();
                end;

            end;
        }
    }


    trigger OnAfterInsert()
    begin
        updateFieldBasedonDivision(false);
        CreateDefultDocumnetLayout();
        Rec.Modify();
    end;

    trigger OnAfterRename()
    begin
        if (xRec."No." <> '') and (Rec."No." <> xRec."No.") then
            UpdateValueonRename(xRec."No.");
        updateFieldBasedonDivision(true);
        CreateDefultDocumnetLayout();
        Rec.Modify();
    end;

    procedure SetUserDivision(Rec: Record Customer)
    var
        RecUserSetup: Record "User Setup";
    begin
        Rec.TestField("Global Dimension 1 Code");
        RecUserSetup.get(UserId);
        RecUserSetup."Division Code" := Rec."Global Dimension 1 Code";
        RecUserSetup.Modify();
    end;

    procedure CreateNewDocument(var Rec: Record Customer; SalesDocType: Enum "Sales Document Type")
    var
        RecSH: Record "Sales Header";
    begin
        RecSH.Init();
        RecSH.Validate("Document Type", SalesDocType);
        RecSH.Validate("Sell-to Customer No.", Rec."No.");
        RecSH.Insert(true);
        Commit();
        if SalesDocType = SalesDocType::Order then
            Page.RunModal(Page::"Sales Order", RecSH)
        else
            if SalesDocType = SalesDocType::"Blanket Order" then
                Page.RunModal(Page::"Blanket Sales Order", RecSH)
            else
                if SalesDocType = SalesDocType::Invoice then
                    Page.RunModal(Page::"Sales Invoice", RecSH)
                Else
                    IF SalesDocType = SalesDocType::"Credit Memo" then
                        Page.RunModal(Page::"Sales Credit Memo", RecSH)
                    Else
                        If SalesDocType = SalesDocType::"Return Order" then
                            Page.RunModal(Page::"Sales Return Order", RecSH);
    end;

    procedure UpdateFieldBasedonDivision(IsHandle: Boolean)
    var
        NoSeriesLine: Record "No. Series Line";
        DefaultCustomerSetup: Record "Default Customer Setup";
        DefaultDim: Record "Default Dimension";
        DimMgt: Codeunit DimensionManagement;
    begin
        NoSeriesLine.Reset();
        NoSeriesLine.SetRange("Series Code", "No. Series");
        if NoSeriesLine.FindFirst() then
            if DefaultCustomerSetup.Get(NoSeriesLine."Division Code") then begin
                If Not IsHandle then
                    CreateDefultDim(DefaultCustomerSetup."Default Dimension Value Code", DefaultCustomerSetup."Default Allowed Values Filter")
                else begin
                    DefaultDim.Reset();
                    DefaultDim.SetRange("Table ID", 18);
                    DefaultDim.SetRange("No.", Rec."No.");
                    if DefaultDim.FindFirst() then begin
                        DefaultDim.Validate("Dimension Value Code", DefaultCustomerSetup."Default Dimension Value Code");
                        DefaultDim."Value Posting" := DefaultDim."Value Posting"::"Code Mandatory";
                        DefaultDim."Allowed Values Filter" := DefaultCustomerSetup."Default Allowed Values Filter";
                        DefaultDim.Modify();
                    end;
                end;

                Rec."Reminder Terms Code" := DefaultCustomerSetup."Default Reminder Terms Code";
                Rec."Gen. Bus. Posting Group" := DefaultCustomerSetup."Def. Gen. Bus. Posting Group";
                Rec."VAT Bus. Posting Group" := DefaultCustomerSetup."Default VAT Bus. Posting Group";
                DimMgt.UpdateDefaultDim(18, Rec."No.", "Global Dimension 1 Code", "Global Dimension 2 Code");
            end;
    end;

    local procedure CreateDefultDim(DimValueCode: Text; DimValueFilter: Text)
    var
        DefaultDimension: Record "Default Dimension";
    begin
        DefaultDimension.Init();
        DefaultDimension.Validate("Table ID", 18);
        DefaultDimension.Validate("No.", Rec."No.");
        DefaultDimension.Validate("Dimension Code", 'CO-DIV');
        DefaultDimension.Validate("Dimension Value Code", DimValueCode);
        DefaultDimension."Value Posting" := DefaultDimension."Value Posting"::"Code Mandatory";
        DefaultDimension."Allowed Values Filter" := DimValueFilter;
        DefaultDimension.Insert();
    end;

    local procedure CreateDefultDocumnetLayout()
    var
        CustomReportSelection: Record "Custom Report Selection";

    begin
        CustomReportSelection.Init();
        CustomReportSelection."Source Type" := 18;
        CustomReportSelection."Source No." := Rec."No.";
        CustomReportSelection.Usage := CustomReportSelection.Usage::"C.Statement";
        CustomReportSelection.Sequence := 1;
        CustomReportSelection.Validate("Report ID", 50006);
        CustomReportSelection.Validate("Send To Email", Rec."E-Mail");
        CustomReportSelection.Validate("Use for Email Body", true);
        CustomReportSelection.Validate("Email Body Layout Code", '50006-000001');
        CustomReportSelection.Insert();

        CustomReportSelection.Init();
        CustomReportSelection."Source Type" := 18;
        CustomReportSelection."Source No." := Rec."No.";
        CustomReportSelection.Usage := CustomReportSelection.Usage::Reminder;
        CustomReportSelection.Sequence := 2;
        CustomReportSelection.Validate("Report ID", 50117);
        CustomReportSelection.Validate("Custom Report Layout Code", '50117-000002');
        CustomReportSelection.Validate("Send To Email", Rec."E-Mail");
        CustomReportSelection.Validate("Use for Email Body", true);
        CustomReportSelection.Validate("Email Body Layout Code", '50117-000001');
        CustomReportSelection.Insert();
    end;

    local procedure UpdateValueonRename(CustNo: Code[20])
    var
        CustReportSelection: Record "Custom Report Selection";
    begin
        CustReportSelection.Reset();
        CustReportSelection.SetRange("Source Type", 18);
        CustReportSelection.SetRange("Source No.", CustNo);
        if CustReportSelection.FindSet() then
            CustReportSelection.DeleteAll();
    end;

    local procedure ClearVariable()
    begin
        Rec."Contact Phone No." := '';
        Rec."Contact E-Mail SMDX" := '';
        Rec."Contact Home Address SMDX" := '';
        Rec."Salutation Code" := '';
        Rec."Contact County" := '';
        Rec."Contact Mobile Phone No." := '';
        Rec."Salutation Description" := '';
        Rec."Contact Post Code" := '';
    end;
}
