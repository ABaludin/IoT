page 50107 "Mq3 setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'MQ3 Setup';
    SourceTable = "MQ3 setup";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Condition; Condition)
                {
                    ApplicationArea = All;
                }
                field(Name; "Limit Value")
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}