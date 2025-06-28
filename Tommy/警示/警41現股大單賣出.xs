{@type:sensor|@guid:0ad75dee9c4a425183ec1b2c5088d0e1}
value1=GetField("買進特大單量");
value2=GetField("買進大單量");
value3=GetField("買進中單量");

value4=GetField("賣出特大單量");
value5=GetField("賣出大單量");
value6=GetField("賣出中單量");

value7=value1+value2;//買進總合
value8=value4+value5;//賣出總合
value21=value7-value8;//買賣差額

if value21<lowest(value21[1],300) then ret=1;