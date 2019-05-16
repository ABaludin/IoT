table 50106 "MQ3 setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Entry; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(2; "Limit Value"; integer)
        {
            DataClassification = CustomerContent;
        }
        field(3; Condition; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = notdrunk,drunk;
            OptionCaption = 'Not drunk, Drunk';
        }
    }

    keys
    {
        key(PK; Entry)
        {
            Clustered = true;
        }
    }
}