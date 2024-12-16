pageextension 50200 "SDYCsmCaseListExt" extends "SDY CSM Case List"
{
    layout
    {
        addafter("Contact Name")
        {
            field("Customer Blocked status"; Rec."Customer Blocked status")
            {
                ApplicationArea = all;
            }
            field("Due Date"; Rec."Due Date")
            {
                ApplicationArea = all;
            }
            field("Salesperson Code"; Rec."Salesperson Code")
            {
                ApplicationArea = all;
            }
            field("Salesperson Name"; Rec."Salesperson Name")
            {
                ApplicationArea = all;
            }
            field("Customer No"; Rec.ReporterCompanyNo)
            {
                Caption = 'Customer No.';
                ApplicationArea = all;
            }
            field("Customer Name"; Rec.ReporterCompanyName)
            {
                Caption = 'Customer Name';
                ApplicationArea = all;
            }
        }
        addbefore("Total Cost (LCY)")
        {
            field(TotAttachValue; TotAttachValue)
            {
                CaptionML = ENG = 'Total Attachment Value';
                ApplicationArea = all;
            }
        }
        addafter("Total Cost (LCY)")
        {
            field(SavedValue; SavedValue)
            {
                CaptionML = ENG = 'Saved Value';
                ApplicationArea = all;
            }
        }
        modify("Total Cost (LCY)")
        {
            Caption = 'Lost Value';
        }

    }
    trigger OnAfterGetRecord()
    begin
        CalculateValues();
    end;

    local procedure CalculateValues()
    var
        CaseActionLink: Record "SDY CSM Case Action Link";
    begin
        TotAttachValue := 0;
        Rec.CalcFields("Total Cost (LCY)");
        CaseActionLink.SetRange("Case No.", Rec."No.");
        if CaseActionLink.FindSet() then
            repeat
                CalculateValuesofLine(CaseActionLink);
            until CaseActionLink.Next() = 0;
        SavedValue := TotAttachValue - Rec."Total Cost (LCY)";
    end;

    local procedure CalculateValuesofLine(CaseActionLink: Record "SDY CSM Case Action Link")
    var
        FielRef: FieldRef;
        RecID: RecordId;
        RecRef: RecordRef;
        SH: Record "Sales Header";
        PH: Record "Purchase Header";
        SI: Record "Sales Invoice Header";
        SCM: Record "Sales Cr.Memo Header";
        PI: Record "Purch. Inv. Header";
        PCM: Record "Purch. Cr. Memo Hdr.";
        Doctype: Integer;
        DocNo: Code[20];
    begin
        RecRef := CaseActionLink."Record ID".GetRecord();
        RecID := RecRef.RecordId;
        if RecID.TableNo = 36 then begin
            FielRef := RecRef.Field(1);
            Doctype := FielRef.Value;
            FielRef := RecRef.Field(3);
            DocNo := FielRef.Value;
            if SH.get(Doctype, DocNo) then SH.CalcFields(Amount);
            TotAttachValue += SH.Amount;
        end;
        if RecID.TableNo = 38 then begin
            FielRef := RecRef.Field(1);
            Doctype := FielRef.Value;
            FielRef := RecRef.Field(3);
            DocNo := FielRef.Value;
            if PH.get(Doctype, DocNo) then PH.CalcFields(Amount);
            TotAttachValue += PH.Amount;
        end;
        if RecID.TableNo = 112 then begin
            FielRef := RecRef.Field(3);
            DocNo := FielRef.Value;
            if SI.get(DocNo) then SI.CalcFields(Amount);
            TotAttachValue += SI.Amount;
        end;
        if RecID.TableNo = 114 then begin
            FielRef := RecRef.Field(3);
            DocNo := FielRef.Value;
            if SCM.get(DocNo) then SCM.CalcFields(Amount);
            TotAttachValue += SCM.Amount;
        end;
        if RecID.TableNo = 122 then begin
            FielRef := RecRef.Field(3);
            DocNo := FielRef.Value;
            if PI.get(DocNo) then PI.CalcFields(Amount);
            TotAttachValue += PI.Amount;
        end;
        if RecID.TableNo = 124 then begin
            FielRef := RecRef.Field(3);
            DocNo := FielRef.Value;
            if PCM.get(DocNo) then PCM.CalcFields(Amount);
            TotAttachValue += PCM.Amount;
        end;
    end;

    var
        TotAttachValue: Decimal;
        SavedValue: Decimal;
}
