{@type:sensor|@guid:3cba8f476f704159a6305b62fd4c025a}
if barfreq <>"Min" or  barinterval<> 1 then raiseruntimeerror("歹勢，本腳本只適用於1分鐘線");

variable:count(0);

if date<>date[1] then count=0;
count=count+1;

//開盤跳空漲2.5%~5%，前5分鐘振幅1.5%以內，成交量過500張，1分K突破跳通知！
if GetField("開盤價","D") > GetField("收盤價","D")[1]*1.025//開盤跳空漲超過2.5%
and count>20 
and GetField("開盤價","D") < GetField("收盤價","D")[1]*1.05//開盤跳空漲不到5%
and lowest(low[1],count-1)*1.015>highest(high[1],count-1) //窄幅整理振幅1.5%內
and close =highest(high,count)
and summation(volume, count-1) > 500 //今日成交量超過500張
then ret=1;
