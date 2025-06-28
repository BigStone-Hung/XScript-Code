{@type:sensor|@guid:4fe32d9312d644ea8b02b36d7ec1d71e}
if q_DailyVolume>300 or q_PreTotalVolume>300 then begin

Value1 = Month(date);
if value1<>value1[1] then value2=currentbar;
value3=currentbar-value2+1;
value4=xaverage(close,value3);

if value4>value4[5] and low[2]<value4 and low>value4 then ret=1;

end;
