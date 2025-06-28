{@type:sensor|@guid:3735a517681b49a584ec41ccd3c1d893}

condition1=close cross above EMA(close,20);
value1=countif(condition1,3);

condition2=RSI(close,12) cross above 50;
value2=countif(condition2,3);

condition3=RSI(close,15) cross above 50;
value3=countif(condition3,3);

condition4=DMO(15) cross above 0;
value4=countif(condition4,3);

condition5=Close>close[1]*1.03;
value5=countif(condition5,3);

if Volume>volume[1]*1.5 then begin
   if value5>0 then begin
   if value1>0 and value2>0 and value3>0 and value4>0 then begin
   ret=1;
   end;
   end;
end;