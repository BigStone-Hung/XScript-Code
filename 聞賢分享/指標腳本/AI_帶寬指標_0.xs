{@type:indicator|@guid:2f50d716fb224424bfa1b53cdf480f06}
input: Length(20);	SetInputName(1, "布林通道天數");
input: BandRange(2);SetInputName(2, "上下寬度");

variable: up(0), down(0), mid(0);

up = bollingerband(Close, Length, BandRange);
down = bollingerband(Close, Length, -1 * BandRange);
if up - down = 0 then value1 = 0 else value1 = (close - down) * 100 / (up - down);

value2=(ema(close,20)-ema(close[1],20))*100/ema(close[1],20);
value3=(up-down)*100/ema(close,20); //帶寬

plot1(value3, "帶寬指標");

