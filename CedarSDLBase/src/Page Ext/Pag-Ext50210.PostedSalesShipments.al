pageextension 50210 "Posted Sales Shipments" extends "Posted Sales Shipments"
{
    trigger OnOpenPage()
    begin
        if IsolatedStorage.Contains('DIVISION', DataScope::CompanyAndUser)then IsolatedStorage.Get('DIVISION', DataScope::CompanyAndUser, IsoText);
        if IsoText <> '' then Rec.SETFILTER("Sell-to Customer No.", IsoText);
    end;
    var IsoText: Text;
}
