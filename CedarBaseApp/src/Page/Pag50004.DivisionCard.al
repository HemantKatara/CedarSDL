page 50004 "Division Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Division;


    layout
    {
        area(Content)
        {
            group(General)
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
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = all;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = all;
                }
                field("Dispatch E-Mail"; Rec."Dispatch E-Mail")
                {
                    ApplicationArea = all;
                }
                field("Company Name"; Rec."Company Name")
                {

                    ApplicationArea = all;
                }
                field("Legal Entity Name"; Rec."Legal Entity Name")
                {
                    ApplicationArea = all;
                }
                field("Colour Code"; Rec."Colour Code")
                {
                    ApplicationArea = all;
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = all;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = all;

                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = all;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = all;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = all;
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = all;
                }


            }
            group("Bank Details")
            {
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = all;
                }
                field("Bank Branch No."; Rec."Bank Branch No.")
                {
                    Caption = 'Sort Code';
                    ApplicationArea = all;
                }
                field("Bank Account No."; Rec."Bank Account No.")
                {
                    ApplicationArea = all;
                }
                field("Registration No."; Rec."Registration No.")
                {
                    Caption = 'Company Registration No.';
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}