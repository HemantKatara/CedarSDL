pageextension 50209 "Vendor List Ext" extends "Vendor Lookup"
{
    trigger OnOpenPage()
    begin
        if IsolatedStorage.Contains('DIVISION', DataScope::CompanyAndUser)then IsolatedStorage.Get('DIVISION', DataScope::CompanyAndUser, IsoText);
        if IsoText <> '' then Rec.SETFILTER("No.", IsoText);
    end;
    var IsoText: Text;
}
