{@type:function_bool|@guid:e3ca1bfd773040b3af2450e5ec0e8c7b}
SetBarMode(1);// XQ: 外盤動能趨勢(5)
input:length(numeric);
input:length1(numeric);

value1=getfield("外盤量");
value2=getfield("內盤量");
value3=summation(value1,Length);
value4=summation(value2,Length);
if value4<>0 then 
value5=value3/value4;
value6=average(value5,length1);

bidask_trendU=value6>value6[1];  //外盤動能趨勢U
