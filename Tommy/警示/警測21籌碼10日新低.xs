{@type:sensor|@guid:5eee65091ad64e98a599b3569b43ead5}
value1=GetField("外資持股","日");
value2=GetField("投信持股","日");
value3=GetField("主力持股","日");
value4=value1+value2+value3;

if value4<=lowest(value4,10) then ret=1;
