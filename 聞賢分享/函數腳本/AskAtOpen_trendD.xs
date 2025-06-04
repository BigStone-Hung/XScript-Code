{@type:function_bool}
SetBarMode(1);//pcratio_trend (5)
input:length(numeric);

value1=GetField("開盤委賣");
value2=average(value1,length);

AskAtOpen_trendD=value2<value2[1]; 