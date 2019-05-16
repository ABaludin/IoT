page 50105 "MQ3 values"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Mq data";
    SourceTableView = order(descending);

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(EntryNo; EntryNo)
                {
                    ApplicationArea = All;
                }
                field("MQ3 value"; "MQ value")
                {
                    ApplicationArea = All;
                }
                field("Creation date"; "Creation Date")
                {
                    ApplicationArea = All;
                }
                field("Creation time"; "Creation Time")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}