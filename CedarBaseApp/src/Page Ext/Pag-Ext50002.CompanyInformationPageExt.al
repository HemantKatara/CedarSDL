pageextension 50002 "CompanyInformationPageExt" extends "Company Information"
{
    layout
    {
        addlast(General)
        {
            field("Check Division Consistent"; Rec."Check Division Consistent")
            {
                ApplicationArea = all;
            }
            field("Parent Company"; Rec."Parent Company")
            {
                ApplicationArea = all;
            }
        }

    }
}
