{@type:sensor|@guid:aef6edf1feca443faffb72e27fe10227}
Vars: Str1("");

value1=getfield("成交量", "D")[1];
value2=getfield("收盤價", "D")[1];
value3=getfield("最高價", "D")[1];
value4=getfield("最低價", "D")[1];
str1=numtostr(value13,2);

condition1=value1>value1[1]; //條件一，成交量>前一根K成交量
condition2=value1[1]>300;  //條件二，成交量>500(張或口)
condition3=value2>highest(value3[1],3); //條件三，成交價>前3日最高價

if condition1 and condition2 and condition3 then begin //3個條件都符合就開始
value11=highest(value3[1],3); //紀錄前3日最高價
value12=value4; //紀錄當根K最低價
end;

value13=minList(value11,value12);

if close<value13 and close>value13*0.985 then begin

value21=summation(volume[1],3);
if volume>value21 or volume>value24 then begin
value22=high;
value23=low;
value24=volume;
end;

if q_PreTotalVolume>500 or q_DailyVolume>500 then begin 
   if volume>50 then begin
     if close crosses below value22 or value22<value22[1] then begin
	 ret=1;
	 RetMsg = "停損價"+Str1;
	 end;
   end;
end;

end;