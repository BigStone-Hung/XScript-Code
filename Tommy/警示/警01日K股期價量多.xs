{@type:sensor|@guid:43a269704d3c434da82577afe2a368b8}
Vars: Str1(""),Str2(""),Str3(""),Str4(""),Str5(""),Str6("");

{
多訊條件
1.成交量大於前日成交量
2.成交量大於300
3.收盤價大於前3日最高價
}

condition1=volume>volume[1] and volume>300 and close>highest(High[1],3);

if condition1 then begin 
      value1=highest(High[1],3);
      value2=low;
	  value3=1;
end;

condition2=close crosses below value2;

//統計多訊次數
if condition2 then begin
   value4=CurrentBar;
end;
value5=countif(condition1,currentbar-value4);
Str1=numtostr(value5,0);
str2=numtoStr(value2,2);
str3=numtoStr(close-value2,2);
str4=numtostr(close,2);//成交價
str5=numtostr(q_TargetChange,2);//漲跌
str6=numtostr(q_PriceChangeRatio,2);//漲跌幅

//多訊
if condition1 then begin
   ret=1;
   RetMsg = "多訊"+Str1+"次"+"  防守"+str2+"  價差"+str3;
end;