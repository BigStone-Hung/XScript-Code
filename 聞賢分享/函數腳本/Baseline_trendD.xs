{@type:function_bool}
SetBarMode(1);// XQ: baseline(26)

input: Length(numeric);

value1=highest(high,Length);
value2=lowest(low,Length);
value3=(value1+value2)/2;  //基準線

Baseline_trendD=value3<value3[1] and c<value3; //基準線趨勢D