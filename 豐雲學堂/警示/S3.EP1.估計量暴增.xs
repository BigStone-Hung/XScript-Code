{@type:sensor|@guid:ee1cc0e5e195413ebe8a11df3ecd87cb}
var: xK1(0);
var: xVavg(0);
var: xVmax(0);
var: xVestimate("");
input: xTime(090100,"開始監控時間");
input: xMultiple(2,"估計量暴增倍數");
input: xPrice(5,"價暴漲(%)");
input: xVmin(1000,"最小均量(張)");
input: xDays(5,"日均量天數");

//初始設定
if date <> date[1] then
	begin
		xK1 = currentBar;
		xVavg = average(getfield("成交量","D")[1],xDays);
		xVmax = GetQuote("估計量");
	end;
if xVavg < xVmin then return;
if currentBar > xK1 and GetQuote("估計量") > xVmax then xVmax = GetQuote("估計量");
{
//估計量暴增
if time > xTime then
	begin
		if xVmax > xVavg*xMultiple then
			begin
				ret=1;
				xVestimate = text("當日量= ",numtoStr(q_DailyVolume,0),"張 vs. ","估計量= ",numtoStr(xVmax,0),"張 vs. ",numtoStr(xDays,0),"日均量= ",numtoStr(xVavg,0),"張");
				retmsg = xVestimate;
			end;
	end;
}
//估計量暴增 & 價暴漲
if time > xTime then
	begin
		if xVmax > xVavg*xMultiple and q_Last > getfield("收盤價","D")[1]*(1+xPrice/100) then
			begin
				ret=1;
				xVestimate = text("當日量= ",numtoStr(q_DailyVolume,0),"張 vs. ","估計量= ",numtoStr(xVmax,0),"張 vs. ",numtoStr(xDays,0),"日均量= ",numtoStr(xVavg,0),"張");
				retmsg = xVestimate;
			end;
	end;