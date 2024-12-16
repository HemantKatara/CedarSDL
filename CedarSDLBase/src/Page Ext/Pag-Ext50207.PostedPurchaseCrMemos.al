pageextension 50207 "Posted Purchase Cr Memos" extends "Posted Purchase Credit Memos"
{
    trigger OnOpenPage()
    begin
        if IsolatedStorage.Contains('DIVISION', DataScope::CompanyAndUser)then IsolatedStorage.Get('DIVISION', DataScope::CompanyAndUser, IsoText);
        if IsoText <> '' then Rec.SETFILTER("Buy-from Vendor No.", IsoText);
    end;
    var IsoText: Text;
}
