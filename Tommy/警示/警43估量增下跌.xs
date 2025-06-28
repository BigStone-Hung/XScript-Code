{@type:sensor|@guid:de5b15c081f44eb98d40637527650c0f}
value1=GetField("買進特大單量");
value2=GetField("買進大單量");
value3=GetField("賣出特大單量");
value4=GetField("賣出大單量");
value5=value1+value2;
value6=value3+value4;

if value5>value6 then begin
value7=low;
end;

if close cross below value7 then begin
value9=high;
end;

if GetField("估計量")>GetField("估計量")[1] and value9<value9[1] then begin 
   ret=1;
end;
