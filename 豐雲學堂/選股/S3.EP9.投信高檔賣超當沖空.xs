{@type:filter}
setbarfreq("D");
settotalbar(60);

input: drawdown(5, "高點回檔幅度(%)"), net_sell(100, "賣超張數"), days(60, "統計幾日漲幅"), change(20, "累積漲幅(%)") ;
value1= getField("投信買賣超", "D");

if value1 < -net_sell 
and c >= highest(c, days) * (1 - drawdown / 100) 
and rateOfChange(c, days) >= change 
then ret=1;