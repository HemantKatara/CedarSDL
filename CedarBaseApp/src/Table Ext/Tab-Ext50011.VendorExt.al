tableextension 50011 "Vendor Ext" extends Vendor
{

    procedure SetUserDivision(Rec: Record Vendor)
    var
        RecUserSetup: Record "User Setup";
    begin
        Rec.TestField("Global Dimension 1 Code");
        RecUserSetup.get(UserId);
        RecUserSetup."Division Code" := Rec."Global Dimension 1 Code";
        RecUserSetup.Modify();
    end;

    procedure CreateNewDocument(var Rec: Record Vendor; PurchDocType: Enum "Purchase Document Type")
    var
        RecPH: Record "Purchase Header";
    begin
        RecPH.Init();
        RecPH.Validate("Document Type", PurchDocType);
        RecPH.Validate("Buy-from Vendor No.", Rec."No.");
        RecPH.Insert(true);
        Commit();
        if PurchDocType = PurchDocType::Order then
            Page.RunModal(Page::"Purchase Order", RecPH)
        else
            if PurchDocType = PurchDocType::"Blanket Order" then
                Page.RunModal(Page::"Blanket Purchase Order", RecPH)
            else
                if PurchDocType = PurchDocType::Invoice then
                    Page.RunModal(Page::"Purchase Invoice", RecPH)
                Else
                    IF PurchDocType = PurchDocType::"Credit Memo" then
                        Page.RunModal(Page::"Purchase Credit Memo", RecPH)
                    Else
                        If PurchDocType = PurchDocType::"Return Order" then
                            Page.RunModal(Page::"Purchase Return Order", RecPH);
    end;
}
