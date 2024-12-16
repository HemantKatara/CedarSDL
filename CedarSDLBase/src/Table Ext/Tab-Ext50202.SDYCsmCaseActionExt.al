tableextension 50202 "SDYCsmCaseActionExt" extends "SDY CSM Case Action"
{
    fields
    {
    }
    keys
    {
        key(Key2; "Due Date")
        {
        }
    }
    trigger OnAfterInsert()
    var
        SDYCsmCaseAction: Record "SDY CSM Case Action";
        SDYCsmCase2: Record "SDY CSM Case";
    begin
        SDYCsmCaseAction.Reset();
        SDYCsmCaseAction.SetRange("Case No.", Rec."Case No.");
        SDYCsmCaseAction.SetFilter("Due Date", '>%1', Today);
        SDYCsmCaseAction.SetCurrentKey("Due Date");
        if SDYCsmCaseAction.FindFirst() then begin
            SDYCsmCase2.Reset();
            SDYCsmCase2.SetRange("No.", SDYCsmCaseAction."Case No.");
            if SDYCsmCase2.FindFirst() then begin
                SDYCsmCase2."Due Date" := SDYCsmCaseAction."Due Date";
                SDYCsmCase2.Modify();
            end;
        end;
    end;

    trigger OnAfterModify()
    var
        SDYCsmCaseAction: Record "SDY CSM Case Action";
        SDYCsmCase2: Record "SDY CSM Case";
    begin
        SDYCsmCaseAction.Reset();
        SDYCsmCaseAction.SetRange("Case No.", Rec."Case No.");
        SDYCsmCaseAction.SetFilter("Due Date", '>%1', Today);
        SDYCsmCaseAction.SetCurrentKey("Due Date");
        if SDYCsmCaseAction.FindFirst() then begin
            SDYCsmCase2.Reset();
            SDYCsmCase2.SetRange("No.", SDYCsmCaseAction."Case No.");
            if SDYCsmCase2.FindFirst() then begin
                SDYCsmCase2."Due Date" := SDYCsmCaseAction."Due Date";
                SDYCsmCase2.Modify();
            end;
        end;
    end;

    var
        SDYCasePage: page "SDY CSM Case Card";
}
