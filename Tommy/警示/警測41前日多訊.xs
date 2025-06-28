{@type:sensor|@guid:b406f8d1d70c4006a08ad0f0bdb4ad6e}
condition1=volume[1]>volume[2]; //條件一，成交量>前一根K成交量
condition2=volume[1]>500;  //條件二，成交量>300(張或口)
condition3=close[1]>highest(High[2],3); //條件三，成交價>前3日最高價

if condition1 and condition2 and condition3 then begin //3個條件都符合就開始
ret=1;
end;