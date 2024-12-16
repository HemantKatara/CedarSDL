pageextension 50205 "Purchase List Ext" extends "Purchase List"
{
    trigger OnOpenPage()
    begin
        if IsolatedStorage.Contains('DIVISION', DataScope::CompanyAndUser)then IsolatedStorage.Get('DIVISION', DataScope::CompanyAndUser, IsoText);
        if IsoText <> '' then Rec.SETFILTER("Buy-from Vendor No.", IsoText);
    end;
    var IsoText: Text;
}
