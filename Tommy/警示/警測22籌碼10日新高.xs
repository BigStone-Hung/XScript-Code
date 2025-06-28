{@type:sensor|@guid:024f73138a0c4ec5bdc73d1301bfe449}
value1=GetField("外資持股","日")[1];
value2=GetField("投信持股","日")[1];
value3=GetField("主力持股","日")[1];
value4=value1+value2+value3;

if value4>=highest(value4,10) then ret=1;