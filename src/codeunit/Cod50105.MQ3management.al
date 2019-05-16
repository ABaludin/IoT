codeunit 50105 "MQ3 management"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post (Yes/No)", 'OnBeforeConfirmSalesPost', '', false, false)]
    local procedure MyProcedure()
    var
        MQ3Values: Record "MQ data";
        MQ3Setup: Record "MQ3 setup";
        LastEntryNo: Integer;
    begin
        MQ3Setup.get();
        If MQ3Values.FindLast() then
            LastEntryNo := MQ3Values.EntryNo;

        MQ3Values.SetRange(EntryNo, LastEntryNo - 5, LastEntryNo);

        case MQ3Setup.Condition of
            MQ3Setup.Condition::notdrunk:
                begin
                    MQ3Values.Setfilter("MQ value", '>%1', MQ3Setup."Limit Value");
                    If MQ3Values.FindFirst() then
                        Error(Error001_Err);
                end;
            MQ3Setup.Condition::drunk:
                begin
                    MQ3Values.Setfilter("MQ value", '<=%1', MQ3Setup."Limit Value");
                    If MQ3Values.FindFirst() then
                        Error(Error002_Err);
                end;
        end;

    end;

    var
        Error001_Err: Label 'You are drunk, orders posting prohibited!';
        Error002_Err: Label 'You are not drunk, orders posting prohibited!';

}