{@type:sensor|@guid:90cc478222874936a38f78c4b0b86607}
inputs:V1(1.5,"估量倍數");
Value1 = GetQuote("估計量");
Value2 = GetQuote("昨量");
value3=summation(volume[1],3);

if volume>value3 or volume>value6 then begin
value4=high;
value5=low;
value6=volume;
end;

if value2>1000 then begin
   if value1>(value2*V1) then begin
   if close crosses above value4 or value4>value4[1] then begin
   ret=1;
   end;
   end;
end;
