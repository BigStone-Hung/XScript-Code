{@type:sensor|@guid:f6790d0cdbc84d3ea8dcef278cea7879}
value1=GetField("買進特大單金額");
value2=GetField("賣出特大單金額");
value3=GetField("買進大單金額");
value4=GetField("賣出大單金額");
value5=value1+value3-value2-value4;
if date<>date[1] then begin 
value8=currentbar;
end;
if value5<-10000000 then begin
value7=high[1];
end;
value10=lowest(value7,currentbar-value8);

if q_EstimatedTotalVolume*close>100000 then begin
if value7<value7[1] and close=q_DailyLow then ret=1;
end;
