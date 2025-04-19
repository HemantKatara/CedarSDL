page 50052 "Field List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Field;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(TableNo; Rec.TableNo)
                {
                    ApplicationArea = All;

                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field(TableName; Rec.TableName)
                {
                    ApplicationArea = All;

                }
                field(FieldName; Rec.FieldName)
                {
                    ApplicationArea = All;

                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;

                }
                field(Len; Rec.Len)
                {
                    ApplicationArea = All;

                }
                field(Class; Rec.Class)
                {
                    ApplicationArea = All;

                }
                field(Enabled; Rec.Enabled)
                {
                    ApplicationArea = All;

                }
                field("Type Name"; Rec."Type Name")
                {
                    ApplicationArea = All;

                }
                field("Field Caption"; Rec."Field Caption")
                {
                    ApplicationArea = All;

                }
                field(RelationTableNo; Rec.RelationTableNo)
                {
                    ApplicationArea = All;

                }
                field(RelationFieldNo; Rec.RelationFieldNo)
                {
                    ApplicationArea = All;

                }
                field(SQLDataType; Rec.SQLDataType)
                {
                    ApplicationArea = All;

                }
                field(OptionString; Rec.OptionString)
                {
                    ApplicationArea = All;

                }
                field(ObsoleteState; Rec.ObsoleteState)
                {
                    ApplicationArea = All;

                }
                field(ObsoleteReason; Rec.ObsoleteReason)
                {
                    ApplicationArea = All;

                }
                field(DataClassification; Rec.DataClassification)
                {
                    ApplicationArea = All;

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