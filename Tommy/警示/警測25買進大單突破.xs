{@type:sensor|@guid:62438af6aec54888a2ef0febdcd68371}
value1=GetField("買進特大單金額");
value2=GetField("賣出特大單金額");
value3=GetField("買進大單金額");
value4=GetField("賣出大單金額");
value5=value1+value3-value2-value4;
if date<>date[1] then begin 
value8=currentbar;
end;
if value5>10000000 then begin
value6=low[1];
end;
value9=highest(value6,currentbar-value8);

if q_EstimatedTotalVolume*close>100000 then begin
if value9>value9[1] and close=q_DailyHigh then ret=1;
end;


