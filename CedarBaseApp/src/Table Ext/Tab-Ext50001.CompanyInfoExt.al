tableextension 50001 "CompanyInfoExt" extends "Company Information"
{
    fields
    {
        field(50000; "ARC Logo"; Blob)
        {
            Caption = 'ARC Logo';
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
        }
        field(50001; "CRN Logo"; Blob)
        {
            Caption = 'CRN Logo';
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
        }
        field(50002; "GLOB Logo"; Blob)
        {
            Caption = 'GLOB Logo';
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
        }
        field(50003; "GLS Logo"; Blob)
        {
            Caption = 'GLS Logo';
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
        }
        field(50004; "HIC Logo"; Blob)
        {
            Caption = 'HIC Logo';
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
        }
        field(50005; "IPC Logo"; Blob)
        {
            Caption = 'IPC Logo';
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
        }
        field(50006; "RCI Logo"; Blob)
        {
            Caption = 'RCI Logo';
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
        }
        field(50007; "Temporary Picture"; Blob)
        {
            Caption = 'Temporary Picture';
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
        }
        field(50008; "Dim Value1"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = FILTER(1));
            Caption = 'Dim Value1';
            DataClassification = ToBeClassified;
        }
        field(50009; "Dim Value2"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = FILTER(1));
            Caption = 'Dim Value2';
            DataClassification = ToBeClassified;
        }
        field(50010; "Dim Value3"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = FILTER(1));
            Caption = 'Dim Value3';
            DataClassification = ToBeClassified;
        }
        field(50011; "Dim Value4"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = FILTER(1));
            Caption = 'Dim Value4';
            DataClassification = ToBeClassified;
        }
        field(50012; "Dim Value5"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = FILTER(1));
            Caption = 'Dim Value5';
            DataClassification = ToBeClassified;
        }
        field(50013; "Dim Value6"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = FILTER(1));
            Caption = 'Dim Value6';
            DataClassification = ToBeClassified;
        }
        field(50014; "Dim Value7"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = FILTER(1));
            Caption = 'Dim Value7';
            DataClassification = ToBeClassified;
        }
        field(50015; "Dim Value8"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = FILTER(1));
            Caption = 'Dim Value8';
            DataClassification = ToBeClassified;
        }
        field(50016; "Dim Value9"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = FILTER(1));
            Caption = 'Dim Value9';
            DataClassification = ToBeClassified;
        }
        field(50017; "Dim Value10"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = FILTER(1));
            Caption = 'Dim Value10';
            DataClassification = ToBeClassified;
        }
        field(50018; "Logo8"; Blob)
        {
            Caption = 'Logo Picture 8';
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
        }
        field(50019; "Logo9"; Blob)
        {
            Caption = 'Logo Picture 9';
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
        }
        field(50020; "Logo10"; Blob)
        {
            Caption = 'Logo Picture 10';
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
        }
        field(50021; "Check Division Consistent"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50022; "Parent Company"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

    }
}
