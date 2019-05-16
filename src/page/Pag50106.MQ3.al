page 50106 "MQ3"
{
    PageType = API;
    Caption = 'MQvalues';
    APIPublisher = 'baludin';
    APIGroup = 'mqValues';
    APIVersion = 'v1.0';
    EntityName = 'mqValue';
    EntitySetName = 'mqValues';
    SourceTable = "Mq data";
    DelayedInsert = true;
    ODataKeyFields = EntryNo;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("mqValue"; "MQ value")
                {
                    Caption = 'mqValue';
                    ApplicationArea = All;
                }
            }
        }
    }
}