tableextension 50004 "Contact Ext" extends Contact
{
    fields
    {
        // Add changes to table fields here
        field(50101; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Shortcut Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1), Blocked = const(false));
        }

    }


}