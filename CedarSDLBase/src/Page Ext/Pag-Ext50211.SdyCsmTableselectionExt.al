pageextension 50211 "SdyCsmTableselectionExt" extends "SDY CSM Table Selection List"
{
    trigger OnOpenPage()
    begin
        Rec.SetRange("Object ID", 110);
    end;
    var myInt: Integer;
}
