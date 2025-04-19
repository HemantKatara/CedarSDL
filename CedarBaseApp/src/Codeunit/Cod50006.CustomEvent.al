codeunit 50006 CustomEvent
{
    SingleInstance = true;


    var
        CaseEmail: Text;

    [EventSubscriber(ObjectType::Table, 43001027, 'OnBeforeValidateEvent', 'Email', false, false)]
    local procedure OnInsert(var Rec: Record "SDY CSM Case Contact"; var xRec: Record "SDY CSM Case Contact")
    begin
        CaseEmail := Rec.Email;
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Mail Management", 'OnBeforeCheckValidEmailAddr', '', false, false)]
    local procedure OnBeforeCheckValidEmailAddr(EmailAddress: Text; var IsHandled: Boolean);
    begin
        if EmailAddress = CaseEmail then
            IsHandled := true;
    end;



}
