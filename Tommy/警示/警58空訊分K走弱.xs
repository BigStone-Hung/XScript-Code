{@type:sensor|@guid:e3ddda4d8c2e413a98bc2480b3218924}
value1=getfield("成交量", "D")[1];
value2=getfield("收盤價", "D")[1];
value3=getfield("最高價", "D")[1];
value4=getfield("最低價", "D")[1];

condition1=value1>value1[1]; //條件一，成交量>前一根K成交量
condition2=value1[1]>300;  //條件二，成交量>500(張或口)
condition3=value2>highest(value3[1],3); //條件三，成交價>前3日最高價

if condition1 and condition2 and condition3 then begin //3個條件都符合就開始
value5=highest(value3[1],3); //紀錄前3日最高價
value6=value4; //紀錄當根K最低價
end;

if close<value6 then begin//日K空訊啟動begin

value21=summation(volume[1],3);
if volume>value21 or volume>value24 then begin
value22=high;
value23=low;
value24=volume;
end;

if q_PreTotalVolume>1000 or q_DailyVolume>500 then begin 
   if volume>50 then begin
      if close crosses below value23 or value23<value23[1] then begin
	  ret=1;
	  end;
   end;
end;

end;//日K空訊啟動end