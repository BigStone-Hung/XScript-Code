{@type:indicator|@guid:bcb74fb580d24ee88cf3f5006ae0ed20}
settotalBar(1000);
input: mode(1,"主圖",inputkind:=dict(["淨值走勢圖",1],["單月報酬",2],["12個月報酬移動平均",3],["MDD",4],["淨值漲跌幅校準(%)",5])
,quickedit:=true);
value1=GetSymbolField("2308.tw","收盤價","M");              //可以改為自己的長期存股組合
value2=GetSymbolField("3008.tw","收盤價","M");
value3=GetSymbolField("1227.tw","收盤價","M");
value4=GetSymbolField("2027.tw","收盤價","M");
value5=GetSymbolField("2352.tw","收盤價","M");
value6=GetSymbolField("2353.tw","收盤價","M");
value7=GetSymbolField("2633.tw","收盤價","M");
value12=GetSymbolField("2834.tw","收盤價","M");
value13=GetSymbolField("9904.tw","收盤價","M");
value14=GetSymbolField("5522.tw","收盤價","M");
value15=GetSymbolField("4938.tw","收盤價","M");
value8=value1+value2+value3+value4+value5+value6+value7+value12+value13+value14+value15;
Once value16=value8; //儲存第一根K棒的執行結果
if value8[1]<>0 then 
value9=(value8-value8[1])/value8[1]*100;  //value9用來計算漲跌幅
value10=average(value9,12);
if value9<0 and value9[1]>0
then value11=value9                       //value11計算MDD
else if value9<0 and value9[1]<0
then value11=value9+value11[1]
else value11=0;
value17=value8/value16*100;
if mode=1 then plot1(value8,"淨值走勢圖");
if mode=2 then plot2(value9,"單月報酬");
if mode=3 then plot3(value10,"12個月報酬移動平均");
if mode=4 then plot4(value11,"MDD");
if mode=5 then plot5(value17,"淨值漲跌幅校準(%)");

