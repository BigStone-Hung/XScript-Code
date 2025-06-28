{@type:sensor|@guid:7407cc46392942868f58281166fb6ba1}
input:VLn(1000),VLn2(3);
Value1 = GetQuote("估計量");
Value2 = GetQuote("昨量");

if value2>VLn then begin
   if value1>(value2*VLn2) then begin 
   ret=1;
   end;
end;