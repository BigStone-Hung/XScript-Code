{@type:function_bool|@guid:7a954c62810742fc87f6d93ac8a0fcef}
value1 = getField("融券餘額張數");
Value2 = getField("除權息日期");
value3=getbaroffset(dateadd(GetField("除權息日期"),"D",-1));
value4=value1+value3;

ExDividendDate=(value1=0 and value4=0 and value1[1]=0 and value4[0]=0);