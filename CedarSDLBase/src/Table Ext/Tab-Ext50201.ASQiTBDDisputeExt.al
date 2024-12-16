tableextension 50201 "ASQiT-BD-DisputeExt" extends "ASQiT-BD-Dispute"
{
    fields
    {
        modify("Contact No.")
        {
        trigger OnAfterValidate()
        var
            ContactRec: Record Contact;
        begin
            if Rec."Contact No." <> '' then begin
                if contactRec.get(Rec."Contact No.")then begin
                    Rec."Company No":=contactRec."Company No.";
                    Rec."Company Name":=contactRec."Company Name";
                    Rec.Type:=contactRec.Type;
                    Rec."Contact Business Relation":=contactRec."Contact Business Relation";
                end;
            end;
        end;
        }
        field(50200; "Company No"; Code[20])
        {
            Caption = 'Company No';
            DataClassification = ToBeClassified;
        }
        field(50201; "Company Name"; Text[100])
        {
            Caption = 'Company Name';
            DataClassification = ToBeClassified;
        }
        field(50202; "Contact Business Relation";Enum "Contact Business Relation")
        {
            Caption = 'Contact Business Relation';
            DataClassification = ToBeClassified;
        }
        field(50203; Type;Enum "Contact Type")
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
        }
    }
}
