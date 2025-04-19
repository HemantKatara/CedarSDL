codeunit 50005 "ChangeEmailSetup"
{
    [EventSubscriber(ObjectType::Codeunit, 260, 'OnBeforeGetEmailSubject', '', true, true)]
    local procedure ChangeMailSubject2(PostedDocNo: Code[20]; EmailDocumentName: Text[250]; ReportUsage: Integer; var EmailSubject: Text[250]; var IsHandled: Boolean)
    var
        CompanyInformation: Record "Company Information";
        EmailParameter: Record "Email Parameter";
        subject: Text;
        EmailSubjectPluralCapTxt: Label '%1', Comment = '%1 = Customer Name. ';
        EmailSubjectCapTxt: Label '%1 - %2', Comment = '%1 = Customer Name. %2 = Invoice No.';
    begin
        IsHandled := true;
        if PostedDocNo = '' then begin
            Subject := CopyStr(
                StrSubstNo(EmailSubjectPluralCapTxt, EmailDocumentName), 1, MaxStrLen(Subject))
        end else begin
            Subject := CopyStr(
                StrSubstNo(EmailSubjectCapTxt, EmailDocumentName, PostedDocNo), 1, MaxStrLen(Subject))
        end;
        if IsHandled then
            EmailSubject := subject;
    End;

    [EventSubscriber(ObjectType::Table, 21, 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure UpdateCommentsFormGenJnLine(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    var
    begin
        CustLedgerEntry.Comments := GenJournalLine.Comment;

    end;


    //[EventSubscriber(ObjectType::Table, 379, 'OnAfterInsertEvent', '', true, true)]
    //local procedure UpdateNoOfOverDuePSICount(var Rec: Record "Detailed Cust. Ledg. Entry")
    //var
    //Cust: Record Customer;
    //begin
    //  IF Cust.GET(Rec."Customer No.") THEN
    //    REPORT.RUNMODAL(REPORT::UpdateOverDueEntryBatch, FALSE, FALSE, Cust);
    //  end;
}
