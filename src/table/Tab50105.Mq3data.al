table 50105 "Mq data"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; EntryNo; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Entry No.';
        }
        field(2; "MQ value"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'MQ value';
        }
        field(3; "Creation date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Creation Date';
        }
        field(4; "Creation time"; Time)
        {
            DataClassification = CustomerContent;
            Caption = 'Creation Time';
        }
    }

    keys
    {
        key(PK; EntryNo)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        MQ: Record "Mq data";
    begin
        If MQ.findlast() then
            EntryNo := MQ.EntryNo + 1
        else
            EntryNo := 1;

        "Creation date" := DT2Date(CurrentDateTime());
        "Creation time" := DT2Time(CurrentDateTime());
    end;
}