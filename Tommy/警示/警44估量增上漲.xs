{@type:sensor|@guid:bcc6b442d41447c6bc01ce925ed404f2}
value1=GetField("買進特大單量");
value2=GetField("買進大單量");
value3=GetField("賣出特大單量");
value4=GetField("賣出大單量");
value5=value1+value2;
value6=value3+value4;

if value5>value6 then begin
value7=low;
end;

if close cross above value7 then begin
value8=low;
end;

if GetField("估計量")>GetField("估計量")[1] and value8>value8[1] then begin 
   ret=1;
end;