/*reportextension 50002 "OrderConfirmationExt" extends "Order Confirmation"
{
    dataset
    {

        add(pageLoop)
        {
            column(ARCLogo; Comp."ARC Logo")
            {

            }
            column(CRNLogo; Comp."CRN Logo")
            {

            }
            column(GLOBLogo; Comp."GLOB Logo")
            {

            }
            column(GLSLogo; Comp."GLS Logo")
            {

            }
            column(HICLogo; Comp."HIC Logo")
            {

            }
            column(IPCLogo; Comp."IPC Logo")
            {

            }
            column(RCILogo; Comp."RCI Logo")
            {

            }
            column(HidePrice; HidePrice)
            {

            }

        }


    }
    requestpage
    {
        layout
        {
            addlast(options)
            {
                field(HidePrice; HidePrice)
                {
                    ApplicationArea = all;
                    Caption = 'Hide Price';
                }
            }
        }

    }
    var
        Comp: Record "Company Information";
        HidePrice: Boolean;
}
*/