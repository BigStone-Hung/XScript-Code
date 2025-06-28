{@type:sensor|@guid:fcf88b44919c4cf29ab58ef30390c46d}
condition1=close>EMA(close,20);
condition2=RSI(close,12)>50 and RSI(close,15)>50;
condition3=close cross above EMA(close,20);
condition4=RSI(close,12) cross above 50;
condition5=RSI(close,15) cross above 50;

if condition1 or condition2 then begin
   if condition3 or condition4 or condition5 then ret=1;
end;
