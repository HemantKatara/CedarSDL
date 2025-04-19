codeunit 50004 "Update Contact Dimension"
{
    trigger OnRun()
    var
        Customer: Record Customer;
        Contact: Record Contact;
        Vendor: Record Vendor;
        ContBusRel: Record "Contact Business Relation";
    begin
        Customer.reset;
        if Customer.FindSet() then
            repeat
                Customer.TestField("Global Dimension 1 Code");
                ContBusRel.Reset();
                ContBusRel.SetRange("Link to Table", ContBusRel."Link to Table"::Customer);
                ContBusRel.SetRange("No.", Customer."No.");
                if ContBusRel.FindFirst() then begin
                    Contact.Reset();
                    Contact.SetRange("Company No.", ContBusRel."Contact No.");
                    if Contact.FindSet() then
                        repeat
                            Contact."Shortcut Dimension 1 Code" := Customer."Global Dimension 1 Code";
                            Contact.Modify();
                        until Contact.Next() = 0;
                end;
            Until Customer.Next() = 0;
        Vendor.reset;
        if Vendor.FindSet() then
            repeat
                Vendor.TestField("Global Dimension 1 Code");
                ContBusRel.Reset();
                ContBusRel.SetRange("Link to Table", ContBusRel."Link to Table"::Vendor);
                ContBusRel.SetRange("No.", Vendor."No.");
                if ContBusRel.FindFirst() then begin
                    Contact.Reset();
                    Contact.SetRange("Company No.", ContBusRel."Contact No.");
                    if Contact.FindSet() then
                        repeat
                            Contact."Shortcut Dimension 1 Code" := Vendor."Global Dimension 1 Code";
                            Contact.Modify();
                        until Contact.Next() = 0;
                end;
            Until Vendor.Next() = 0;
        Commit();
    end;
}
