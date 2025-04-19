page 50003 "Divisions"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Division;
    CardPageID = "Division Card";
    Editable = false;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = all;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = all;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}