pageextension 50202 "Sales List Ext" extends "Sales List"
{
    trigger OnOpenPage()
    begin
        if IsolatedStorage.Contains('DIVISION', DataScope::CompanyAndUser)then IsolatedStorage.Get('DIVISION', DataScope::CompanyAndUser, IsoText);
        if IsoText <> '' then Rec.SETFILTER("Sell-to Customer No.", IsoText);
    end;
    var IsoText: Text;
}
