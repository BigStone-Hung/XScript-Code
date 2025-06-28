{@type:sensor|@guid:d149639264a64f66851b779b7b0662eb}
condition1=close<EMA(close,20);
condition2=RSI(close,12)<50 and RSI(close,15)<50;
condition3=close cross below EMA(close,20);
condition4=RSI(close,12) cross below 50;
condition5=RSI(close,15) cross below 50;

if condition1 or condition2 then begin
   if condition3 or condition4 or condition5 then ret=1;
end;