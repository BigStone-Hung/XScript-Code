{@type:sensor|@guid:d078d8cfaa414c78896e472ad522c136}
value1=getfield("成交量", "D")[1];
value2=getfield("收盤價", "D")[1];
value3=getfield("最高價", "D")[1];
value4=getfield("最低價", "D")[1];

condition1=value1>value1[1]; //條件一，成交量>前一根K成交量
condition2=value1[1]>300;  //條件二，成交量>500(張或口)
condition3=value2>highest(value3[1],3); //條件三，成交價>前3日最高價

if condition1 and condition2 and condition3 then begin //3個條件都符合就開始
value11=highest(value3[1],3); //紀錄前3日最高價
value12=value4; //紀錄當根K最低價
end;

if high cross Below minList(value11,value12) then ret=1;
