{@type:function_bool|@guid:7a83fd7cf73c4175a8a4ae8e9eec002a}
SetBarMode(1);//pcratio_trend (5)
input:length(numeric);

value1=GetField("開盤委賣");
value2=average(value1,length);

AskAtOpen_trendD=value2<value2[1]; 