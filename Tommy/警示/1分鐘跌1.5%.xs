{@type:sensor|@guid:bdcb828d37e144c686423079c103747b}
value1=highest(q_Last,12);
value2=lowest(q_Last,12);
value3=(value1-value2)/value2;

if value1<>value2 then begin
if value3>0.015 then ret=1;
end;