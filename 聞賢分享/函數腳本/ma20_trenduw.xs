{@type:function_bool|@guid:2295d283acb64997b562b81cde679499}
SetBarMode(1);//ma20_trend (close,20)
input:length(numeric);

MA20_trendUw=average(GetField("收盤價","W"),length)>average(GetField("收盤價","W")[1],length); //pb