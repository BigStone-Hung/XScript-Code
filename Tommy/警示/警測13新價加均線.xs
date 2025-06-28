{@type:sensor|@guid:7c59ec19f4494237887230d50fe11af6}
//類新價線指標
if countif(close>close[1],3)=3 then begin
value1=close[3];
end;
condition1=(close-value1)>0;

//赹線多頭排列
value2=average(close,5);
value3=average(close,10);
value4=average(close,20);
value5=average(close,30);
condition2=value2>value3 and value3>value4 and value4>value5;

//警示條件
if condition1 and condition2 then ret=1;


