{@type:function_bool|@guid:a87e5c5a797746908cfbb72b1c38ea6e}
SetBarMode(1);//ma20_trend (close,20)
input:length(numeric);

MA20_trendDw=average(GetField("收盤價","W"),length)<average(GetField("收盤價","W")[1],length); //pb