{@type:sensor|@guid:3de219899e074c6b84fbec8793ea553b}
//進場條件
condition1=RSI(close,12)>50 and RSI(close,15)>50;
condition2=DMO(14) cross above 0;
condition3=close<=300 and close>=50;

//進場
if condition1 and condition2 and condition3 then begin
if volume>100 then begin
   ret=1;
end; 
end;