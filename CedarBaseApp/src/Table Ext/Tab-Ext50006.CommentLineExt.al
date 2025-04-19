tableextension 50006 "Comment Line Ext" extends "Comment Line"
{
    fields
    {
        // Add changes to table fields here
        field(50001; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50002; "Modified By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50003; "Created DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50004; "Modified DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50005; "Comment 2"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Comment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Salesperson Notes","Customer Service Notes","Credit Control Notes","Verification Notes","Admin Notes",Other;
        }
        field(50007; "Sequence No."; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(50008; "Comment SMDX"; Blob)
        {
            Caption = 'Comment';
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(key2; date)
        {

        }
        key(key3; "Created DateTime")
        {

        }
    }
    trigger OnInsert()
    begin

        "Created By" := UserId;
        "Created DateTime" := CurrentDateTime;
        Date := DT2Date(CurrentDateTime);
    end;



    trigger OnModify()
    begin

        "Modified By" := UserId;
        "Modified DateTime" := CurrentDateTime;
    end;


    var
        myInt: Integer;


    procedure BlobtoText(): Text
    var
        TempInStream: InStream;
        CommentTxt: Text;
    begin
        if Not Rec."Comment SMDX".HasValue then
            exit;
        Rec.CalcFields("Comment SMDX");
        Rec."Comment SMDX".CreateInStream(TempInStream);
        TempInStream.ReadText(CommentTxt);
        exit(CommentTxt);
    end;

    procedure TexttoBlob(Value: Text)
    var
        TempOutstream: OutStream;
    begin
        if Rec."Comment SMDX".HasValue then
            Clear(Rec."Comment SMDX");

        Rec."Comment SMDX".CreateOutStream(TempOutstream);
        TempOutstream.WriteText(Value);
    end;





}

