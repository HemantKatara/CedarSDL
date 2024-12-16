pageextension 50212 "ASQiTBDDisputeCardExt" extends "ASQiT-BD-Dispute Card"
{
    layout
    {
        addafter("Contact Name")
        {
            field("Company No"; Rec."Company No")
            {
                ApplicationArea = all;
            }
            field("Company Name"; Rec."Company Name")
            {
                ApplicationArea = all;
            }
            field(Type; Rec.Type)
            {
                ApplicationArea = all;
            }
            field("Contact Business Relation"; Rec."Contact Business Relation")
            {
                ApplicationArea = all;
            }
        }
    }
}
