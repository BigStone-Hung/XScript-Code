{@type:sensor|@guid:806bb90b224243e398d34185455231d4}
var: xBS(0), xCBS(0);
var: xT(10000000);
var: xPavg("");

input: xMultiple(5,"大單金額(千萬)");
input: xPrice(2, "價格大於均價(%)");
input: xInvest(200, "投信買超(張)");

//初始設定, 定義淨買進特大單
xBS = getField("買進特大單金額")-getField("賣出特大單金額");
if date <> date[1] then xCBS = 0 Else xCBS = xCBS + xBS;

//昨日投信買入, 價格大於盤中均價%
Value1 = getField("投信買賣超張數", "D")[1];
Condition1 = q_Last > q_AvgPrice*(1+xPrice/100);
Condition2 = value1 > xInvest;

if xCBS > xT*xMultiple and condition1 and condition2 then
begin  
      ret = 1;
	  xPavg = text("累積買進= ",numtoStr(xCBS/xT,2), "千萬","當日均價="
	  ,numtoStr(q_AvgPrice, 2), "投信昨買=",numtoStr(value1, 0), "張");
	  retmsg = xPavg;
end;