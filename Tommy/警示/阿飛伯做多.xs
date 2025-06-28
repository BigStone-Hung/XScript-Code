{@type:sensor|@guid:8138a3d270394ae183222cf704d8321a}
value1=average(close,100);
value2=lowest(low,5);
Value3=GetQuote("估計量");

condition1=(value1-value1[2])>0;
condition2=(Value3>volume[1]*3);
condition3=(value3>volume[2]*3);

if condition1 and condition2 and condition3 then begin
   if close>(value2*1.05) then ret=1;
end;