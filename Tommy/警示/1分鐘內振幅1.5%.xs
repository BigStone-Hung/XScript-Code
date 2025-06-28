{@type:sensor|@guid:e238ff738b434723a879775c1ca12308}
value1=highest(q_Last,12);
value2=lowest(q_Last,12);
value3=(value1-value2)/value2;
value4=average(q_Last,12);

if value1<>value2 then begin
if value3>0.015 and value4>value4[6] then ret=1;
end;