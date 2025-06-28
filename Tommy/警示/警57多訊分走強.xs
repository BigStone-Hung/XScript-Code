{@type:sensor|@guid:c015825ece854794be317334606abf36}
value1=getfield("成交量", "D")[1];
value2=getfield("收盤價", "D")[1];
value3=getfield("最高價", "D")[1];
value4=getfield("最低價", "D")[1];

condition1=value1>value1[1]; //條件一，成交量>前一根K成交量
condition2=value1[1]>500;  //條件二，成交量>500(張或口)
condition3=value2>highest(value3[1],3); //條件三，成交價>前3日最高價

if condition1 and condition2 and condition3 then begin //3個條件都符合就開始
value5=highest(value3[1],3); //紀錄前3日最高價
value6=value4; //紀錄當根K最低價
end;

//
value11=summation(volume[1],3);

if volume>value11 or volume>value14 then begin
value12=high;
value13=low;
value14=volume;
end;
//
if close>value6 then begin
if q_PreTotalVolume>1000 or q_DailyVolume>500 then begin 
   if volume>50 then begin
     if close crosses above value12 or value12>value12[1] then begin
	 ret=1;
	 end;
   end;
end;
end;