pageextension 50203 "Posted Sales Invoices" extends "Posted Sales Invoices"
{
    trigger OnOpenPage()
    begin
        if IsolatedStorage.Contains('DIVISION', DataScope::CompanyAndUser)then IsolatedStorage.Get('DIVISION', DataScope::CompanyAndUser, IsoText);
        if IsoText <> '' then Rec.SETFILTER("Sell-to Customer No.", IsoText);
    end;
    var IsoText: Text;
}
