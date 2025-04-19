pageextension 50036 "Purch Order Subform Ext" extends "Purchase Order Subform"
{
    ContextSensitiveHelpPage = 'purchasing-how-record-purchases';
    layout
    {
        modify("No.")
        {

            trigger OnLookup(var Text: Text): Boolean
            var
                EventSubscribe: Codeunit "Subscriber Codeunit";
                NewItemCode: Code[20];
                ItemRec: Record Item;
                PurchHeader: Record "Purchase Header";
                GLaAcc: Record "G/L Account";
                Resource: Record Resource;
                FA: Record "Fixed Asset";
                ChargeItem: Record "Item Charge";
                Vendor: Record Vendor;

            begin
                if Rec.type = Rec.type::item then begin
                    PurchHeader.get(Rec."Document Type", Rec."Document No.");
                    Vendor.get(PurchHeader."Buy-from Vendor No.");
                    Vendor.TestField("Global Dimension 1 Code");
                    Clear(EventSubscribe);
                    EventSubscribe.ItemLookUp(Rec."No.", NewItemCode, Vendor."Global Dimension 1 Code", false, Vendor."No.");
                    if NewItemCode <> '' then begin
                        if Rec."No." <> NewItemCode then begin
                            Rec.Validate("No.", NewItemCode);
                            NoOnAfterValidate();
                            UpdateEditableOnRow();
                            UpdateTypeText();
                            DeltaUpdateTotals();

                        end;
                    end;
                    //CurrPage.Update();
                end;
                if Rec.type = Rec.type::"G/L Account" then begin
                    GLaAcc.Reset();
                    GLaAcc.SetRange("Direct Posting", true);
                    GLaAcc.SetRange(Blocked, false);
                    GLaAcc.SetRange("Account Type", GLaAcc."Account Type"::Posting);
                    if Page.RunModal(Page::"G/L Account List", GLaAcc) = Action::LookupOK then
                        Rec.Validate("No.", GLaAcc."No.");
                end;
                if Rec.type = Rec.type::"Fixed Asset" then begin
                    FA.Reset();
                    if Page.RunModal(Page::"Fixed Asset List", FA) = Action::LookupOK then
                        Rec.Validate("No.", FA."No.");
                end;
                if Rec.type = Rec.type::Resource then begin
                    FA.Reset();
                    if Page.RunModal(Page::"Resource List", Resource) = Action::LookupOK then
                        Rec.Validate("No.", Resource."No.");
                end;
                if Rec.type = Rec.type::"Charge (Item)" then begin
                    FA.Reset();
                    if Page.RunModal(Page::"Item Charges", ChargeItem) = Action::LookupOK then
                        Rec.Validate("No.", ChargeItem."No.");
                end;
            end;
        }
        modify(Description)
        {
            trigger OnLookup(var Text: Text): Boolean
            begin
                //stop lookup
            end;
        }
    }
}