{@type:sensor|@guid:46b44003a5b34d42ae04e92e09348df9}
value1=average(close,100);
value2=highest(high,5);
Value3=GetQuote("估計量");

condition1=(value1-value1[2])<0;
condition2=(Value3>volume[1]*3);
condition3=(value3>volume[2]*3);

if condition1 and condition2 and condition3 then begin
   if close<(value2*0.95) then ret=1;
end;