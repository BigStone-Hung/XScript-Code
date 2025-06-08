{@type:filter}
// XQ: MA-Osc
input: Length1(5, "短週期"), Length2(10, "長週期");


value1 = Average(close, Length1);
value2 = Average(close, Length2);
value3 = (value1 - value2);

if value3 cross over 0 then ret=1;

outputField1(value3[1],"昨日osc");
outputField2(value3,"今日osc");
