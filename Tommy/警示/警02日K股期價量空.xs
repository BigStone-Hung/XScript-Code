{@type:sensor|@guid:8dc28d33f1dd42c494ee217457e9814d}
Vars: Str1(""),Str2(""),Str3(""),Str4(""),Str5(""),Str6("");
str4=numtostr(close,2);//成交價
str5=numtostr(q_TargetChange,2);//漲跌
str6=numtostr(q_PriceChangeRatio,2);//漲跌幅

condition1=volume>300;
condition3=volume>volume[1];
condition4=close>highest(High[1],3);

if condition1 and condition3 and condition4 then begin
value1=low;
end;

if close crosses below value1
then begin 
ret=1;
end;
