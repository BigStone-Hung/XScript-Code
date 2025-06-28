{@type:sensor|@guid:6cf437ae5a854c218ec1b70a387bf886}
Vars: Str1("");
input:tday(20230315,"請輸入特定日期");

value1=getbaroffset(tday);
value2=(close-close[value1])*100/close[value1];
Str1=numtostr(value2,2);

value3=summation(volume[1],3);

if volume>value3 or volume>value4 then begin
value5=high;
value6=low;
value4=volume;
end;

if value2>10 then begin
if close crosses above value5 or value5>value5[1] then ret=1;
RetMsg = Str1;
end;