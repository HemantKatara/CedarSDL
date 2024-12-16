pageextension 50214 "SDYCsmCardExt" extends "SDY CSM Case Card"
{
    layout
    {
        addafter("Sub Category")
        {
            field("Due Date"; Rec."Due Date")
            {
                ApplicationArea = all;
            }
        }
        addafter(DueDateChanges)
        {
            field("Salesperson Code"; Rec."Salesperson Code")
            {
                ApplicationArea = all;
            }
            field("Salesperson Name"; Rec."Salesperson Name")
            {
                ApplicationArea = all;
            }
            field("Customer No"; Rec."Customer No")
            {
                ApplicationArea = all;
            }
            field("Customer Name"; Rec."Customer Name")
            {
                ApplicationArea = all;
            }
        }
    }
    trigger OnAfterGetRecord()
    var
    begin
    end;
}
