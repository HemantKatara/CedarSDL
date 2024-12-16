codeunit 50201 "Common Functions"
{
    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Page, Page::"SDY CSM Case Action LP", 'OnBeforeActionEvent', 'Custom', false, false)]
    local procedure OnBeforeCustom(var Rec: Record "SDY CSM Case Action")
    begin
        SetCustomer(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"SDY CSM Case Action LP", 'OnAfterActionEvent', 'Custom', false, false)]
    local procedure OnAfterCustom(var Rec: Record "SDY CSM Case Action")
    begin
        DeleteIsoStorage();
    end;

    [EventSubscriber(ObjectType::Page, Page::"SDY CSM Case Action LP", 'OnBeforeActionEvent', 'Posted Sales Invoice', false, false)]
    local procedure OnBeforePostedSalesInvoice(var Rec: Record "SDY CSM Case Action")
    begin
        SetCustomer(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"SDY CSM Case Action LP", 'OnAfterActionEvent', 'Posted Sales Invoice', false, false)]
    local procedure OnAfterPostedSalesInvoice(var Rec: Record "SDY CSM Case Action")
    begin
        DeleteIsoStorage();
    end;

    [EventSubscriber(ObjectType::Page, Page::"SDY CSM Case Action LP", 'OnBeforeActionEvent', 'Posted Sales Credit Memo', false, false)]
    local procedure OnBeforePostedSalesCredMemo(var Rec: Record "SDY CSM Case Action")
    begin
        SetCustomer(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"SDY CSM Case Action LP", 'OnAfterActionEvent', 'Posted Sales Credit Memo', false, false)]
    local procedure OnAfterPostedSalesCrMemo(var Rec: Record "SDY CSM Case Action")
    begin
        DeleteIsoStorage();
    end;

    [EventSubscriber(ObjectType::Page, Page::"SDY CSM Case Action LP", 'OnBeforeActionEvent', 'Unposted Sales Documents', false, false)]
    local procedure OnBeforeUnPostedSalesDocument(var Rec: Record "SDY CSM Case Action")
    begin
        SetCustomer(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"SDY CSM Case Action LP", 'OnAfterActionEvent', 'Unposted Sales Documents', false, false)]
    local procedure OnAfterUnPostedSalesDocument(var Rec: Record "SDY CSM Case Action")
    begin
        DeleteIsoStorage();
    end;

    [EventSubscriber(ObjectType::Page, Page::"SDY CSM Case Action LP", 'OnBeforeActionEvent', 'Customer', false, false)]
    local procedure OnBeforeCustomer(var Rec: Record "SDY CSM Case Action")
    begin
        SetCustomer(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"SDY CSM Case Action LP", 'OnAfterActionEvent', 'Customer', false, false)]
    local procedure OnAfterCustomer(var Rec: Record "SDY CSM Case Action")
    begin
        DeleteIsoStorage();
    end;

    [EventSubscriber(ObjectType::Page, Page::"SDY CSM Case Action LP", 'OnBeforeActionEvent', 'Posted Purchase Invoice', false, false)]
    local procedure OnBeforePostedPurchInvoice(var Rec: Record "SDY CSM Case Action")
    begin
        SetVendor(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"SDY CSM Case Action LP", 'OnAfterActionEvent', 'Posted Purchase Invoice', false, false)]
    local procedure OnAfterPostedPurchInvoice(var Rec: Record "SDY CSM Case Action")
    begin
        DeleteIsoStorage();
    end;

    [EventSubscriber(ObjectType::Page, Page::"SDY CSM Case Action LP", 'OnBeforeActionEvent', 'Posted Purchase Credit Memo', false, false)]
    local procedure OnBeforePostedPurchCredMemo(var Rec: Record "SDY CSM Case Action")
    begin
        SetVendor(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"SDY CSM Case Action LP", 'OnAfterActionEvent', 'Posted Purchase Credit Memo', false, false)]
    local procedure OnAfterPostedPurchCrMemo(var Rec: Record "SDY CSM Case Action")
    begin
        DeleteIsoStorage();
    end;

    [EventSubscriber(ObjectType::Page, Page::"SDY CSM Case Action LP", 'OnBeforeActionEvent', 'Unposted Purchase Documents', false, false)]
    local procedure OnBeforeUnPostedPurchDocument(var Rec: Record "SDY CSM Case Action")
    begin
        SetVendor(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"SDY CSM Case Action LP", 'OnAfterActionEvent', 'Unposted Purchase Documents', false, false)]
    local procedure OnAfterUnPostedPurchDocument(var Rec: Record "SDY CSM Case Action")
    begin
        DeleteIsoStorage();
    end;

    [EventSubscriber(ObjectType::Page, Page::"SDY CSM Case Action LP", 'OnBeforeActionEvent', 'Vendor', false, false)]
    local procedure OnBeforeVendor(var Rec: Record "SDY CSM Case Action")
    begin
        SetVendor(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"SDY CSM Case Action LP", 'OnAfterActionEvent', 'Vendor', false, false)]
    local procedure OnAfterVendor(var Rec: Record "SDY CSM Case Action")
    begin
        DeleteIsoStorage();
    end;

    [EventSubscriber(ObjectType::Page, Page::"Contact Card", 'OnNewRecordEvent', '', false, false)]
    local procedure ContactNewRecUpdate(var Rec: Record Contact)
    var
        contactrec: Record Contact;
        CompanyNo: Text[30];
        CustomerNo: Text[30];
    begin
        //if IsolatedStorage.Contains('ContactCompanyNo', DataScope::CompanyAndUser) then
        //  IsolatedStorage.Get('ContactCompanyNo', DataScope::CompanyAndUser, CompanyNo);
        if IsolatedStorage.Contains('ContactCustomerNo', DataScope::CompanyAndUser) then
            if IsolatedStorage.Get('ContactCustomerNo', DataScope::CompanyAndUser, CustomerNo) then begin
                contactrec.Reset();
                contactrec.SetRange("Company No.", CustomerNo);
                if contactrec.FindFirst() then begin
                    Rec.Validate(Type, Rec.Type::Person);
                    Rec.Validate("Company No.", CustomerNo);
                end;
                if IsolatedStorage.Contains('ContactCustomerNo', DataScope::CompanyAndUser) then IsolatedStorage.Delete('ContactCustomerNo', DataScope::CompanyAndUser);
            end;
    end;

    [EventSubscriber(ObjectType::Table, 70283627, 'OnAfterValidateEvent', 'Customer No.', false, false)]
    local procedure PassContactValueOnValidateDisputeRec(var Rec: Record "ASQiT-BD-Dispute")
    var
    begin
        if Rec."Customer No." <> '' then begin
            //    if IsolatedStorage.Contains('ContactCustomerNo', DataScope::Module) then
            //        IsolatedStorage.Delete('ContactCustomerNo');
            IsolatedStorage.Set('ContactCustomerNo', Rec."Customer No.", DataScope::CompanyAndUser);
        end;
    end;

    [EventSubscriber(ObjectType::Page, page::"ASQiT-BD-Dispute Card", 'OnAfterGetRecordEvent', '', false, false)]
    local procedure PassContactValueOnAftrGetDisputeRec(var Rec: Record "ASQiT-BD-Dispute")
    var
    begin
        if Rec."Customer No." <> '' then begin
            // if IsolatedStorage.Contains('ContactCustomerNo', DataScope::Module) then
            //   IsolatedStorage.Delete('ContactCustomerNo');
            IsolatedStorage.Set('ContactCustomerNo', Rec."Customer No.", DataScope::CompanyAndUser);
        end;
    end;

    local procedure SetCustomer(Rec: Record "SDY CSM Case Action")
    var
        ContBusRel: Record "Contact Business Relation";
        RecContact: Record Contact;
        SDYCSMCaseContact: Record "SDY CSM Case Contact";
    begin
        SDYCSMCaseContact.Reset();
        SDYCSMCaseContact.SetRange(CaseNo, rec."Case No.");
        SDYCSMCaseContact.SetRange(Role, SDYCSMCaseContact.Role::Reporter);
        SDYCSMCaseContact.SetRange(Source, SDYCSMCaseContact.Source::Contact);
        if SDYCSMCaseContact.FindFirst() then
            SDYCSMCaseContact.TestField(No);

        RecCase.Get(Rec."Case No.");
        //RecCase.TestField(ReporterNo);

        RecContact.get(SDYCSMCaseContact.No);
        ContBusRel.reset;
        ContBusRel.SETCURRENTKEY("Link to Table", "No.");
        ContBusRel.SETRANGE("Link to Table", ContBusRel."Link to Table"::Customer);
        ContBusRel.SETRANGE("Contact No.", RecContact."Company No.");
        if ContBusRel.FindFirst() then
            IsolatedStorage.Set('DIVISION', ContBusRel."No.", DataScope::CompanyAndUser);
        //RecCust.SetRange("Primary Contact No.", RecCase."Contact No.");
        //if RecCust.FindFirst() then

    end;

    local procedure SetVendor(Rec: Record "SDY CSM Case Action")
    begin
        RecCase.Get(Rec."Case No.");
        RecCase.TestField(ReporterNo);
        RecVend.SetRange("Primary Contact No.", RecCase.ReporterNo);
        if RecVend.FindFirst() then IsolatedStorage.Set('DIVISION', RecVend."No.", DataScope::CompanyAndUser);
    end;

    local procedure DeleteIsoStorage()
    var
        myInt: Integer;
    begin
        if IsolatedStorage.Contains('DIVISION', DataScope::CompanyAndUser) then IsolatedStorage.Delete('DIVISION', DataScope::CompanyAndUser);
    end;

    var
        RecCase: Record "SDY CSM Case";
        RecCust: Record Customer;
        RecVend: Record Vendor;
        RecContact: record Contact;
}
