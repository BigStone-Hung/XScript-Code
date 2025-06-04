{@type:filter|@guid:9c0ac27776614311a3b21956db368855}
// XQ: 大戶持股
input: Length(20);	SetInputName(1, "布林通道天數");
input: BandRange(1);SetInputName(2, "上下寬度");

settotalbar(30);
variable: up(0), down(0), mid(0);

value1=Getfield("大戶持股比例","W",param:=1000);   //篩選出本週超過1,000張的大戶人數。
if value1>0 then
value2=(value1-value1[1])*100/value1;  //周千張大戶持股比例增減%
value3=GetField("收盤價","W");
value4=bb_width(GetField("收盤價","W"),20,2);
value5=StandardDev(value2,20,1); //持股比例增減%標準差;
if value5>0 then
value6=value2/value5; //持股比例增減百分比標準差倍數
value8=GetField("成交量","W");

up = bollingerband(value6, Length, BandRange);
down = bollingerband(value6, Length, -1 * BandRange);
mid = (up + down) / 2;

//進場邏輯
condition1 =  value6>up and not(value4>value4[1] 
             and ma20_trenddw(20));
condition11 = value6<down and not(value4>value4[1] 
             and ma20_trenduw(20));

if condition1 then ret=1;

outputfield1(value2,"持股比例增減%");
outputfield2(value5,"標準差");
outputfield3(value6,"標準差倍數");
outputfield4(up,"1倍標準差");
outputfield5(value8,"周成交量",order:=1);