pageextension 50208 "Customer List Ext" extends "Customer Lookup"
{
    trigger OnOpenPage()
    begin
        if IsolatedStorage.Contains('DIVISION', DataScope::CompanyAndUser)then IsolatedStorage.Get('DIVISION', DataScope::CompanyAndUser, IsoText);
        if IsoText <> '' then Rec.SETFILTER("No.", IsoText);
    end;
    var IsoText: Text;
}
