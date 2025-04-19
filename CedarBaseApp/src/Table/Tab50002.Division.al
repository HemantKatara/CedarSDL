table 50002 "Division"
{
    DataClassification = ToBeClassified;
    LookupPageId = Divisions;
    DrillDownPageId = Divisions;
    DataCaptionFields = Code, name;


    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            trigger OnValidate()
            begin
                "Global Dimension 1 Code" := Code;
            end;

        }
        field(2; Name; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

        }
        field(4; Address; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Address 2"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;

        }
        field(102; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;


        }
        field(103; "Home Page"; Text[80])
        {
            Caption = 'Home Page';
            ExtendedDatatype = URL;
        }
        field(104; Picture; Blob)
        {

            DataClassification = ToBeClassified;
            Subtype = Bitmap;
        }
        field(105; "Company Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Company;
        }
        field(106; "Colour Code"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(107; "VAT Registration No."; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'VAT Registration No.';
        }
        field(108; "Registration No."; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Registration No.';
        }
        field(109; County; Text[30])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
        }
        field(110; City; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'City';
            TableRelation = IF ("Country/Region Code" = CONST('')) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(111; "Country/Region Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty(City, "Post Code", County, "Country/Region Code", xRec."Country/Region Code");
            end;
        }
        field(112; "Post Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Post Code';
            TableRelation = IF ("Country/Region Code" = CONST('')) "Post Code".Code
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code".Code WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(113; "Bank Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bank Name';
        }
        field(114; "Bank Branch No."; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bank Branch No.';
        }
        field(115; "Bank Account No."; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bank Account No.';
        }
        field(116; "Legal Entity Name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(117; "Dispatch E-Mail"; Text[80])
        {
            Caption = 'Dispatch Email';
            ExtendedDatatype = EMail;
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;
        Cust: Record Customer;
        PostCode: Record "Post Code";

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;



}