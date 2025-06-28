{@type:sensor|@guid:3c1feffd0f4c4f12a2bd45ef5f6fa229}
if q_DailyVolume>300 or q_PreTotalVolume>300 then begin

Value1 = Month(date);
if value1<>value1[1] then value2=currentbar;
value3=currentbar-value2+1;
value4=xaverage(close,value3);

if value4<value4[5] and high[2]>value4 and high<value4 then ret=1;

end;