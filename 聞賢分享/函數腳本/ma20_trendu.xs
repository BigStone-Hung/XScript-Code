{@type:function_bool|@guid:09bd8fb934d246c4b3d2d2887be51b63}
SetBarMode(1);//ma20_trend (close,20)
input:price(numeric);
input:length(numeric);

MA20_trendU=average(price,length)>average(price[1],length); //pb