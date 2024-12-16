pageextension 50204 "Posted Sales CrMemo" extends "Posted Sales Credit Memos"
{
    trigger OnOpenPage()
    begin
        if IsolatedStorage.Contains('DIVISION', DataScope::CompanyAndUser)then IsolatedStorage.Get('DIVISION', DataScope::CompanyAndUser, IsoText);
        if IsoText <> '' then Rec.SETFILTER("Sell-to Customer No.", IsoText);
    end;
    var IsoText: Text;
}
