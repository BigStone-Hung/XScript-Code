{@type:function}
// XQ: MFI指標
SetBarMode(2);
input: ratio1(numeric); SetInputName(1, "DMI參數");  //5
input: Period1(numeric); SetInputName(2, "天期");  //5
input: Period2(numeric); SetInputName(3, "點數");  //5
variable:count(0);

count=0;
if RSI(Close, ratio1+1) > RSI(Close, Period1+5)
and rsi(close,ratio1+1)<50 then
	count=1;
if Momentum(Close, period1+5) > 0 then
	count=count+1;

variable:pdi_value(0);
variable:ndi_value(0);
variable:adx_value(0);
directionmovement(period1+5,pdi_value,ndi_value,adx_value);
if pdi_value > ndi_value then 
	count=count+1;
	
variable:rsv1(0),k1(0),d1(0);
stochastic(9,3,3,rsv1,k1,d1);
if k1 > d1 then 
	count=count+1;

value11=average(volume,period1+5);
if linearregslope(value11,period2+3)>0 then
	count=count+1;

value12=average(close,period2+3);
if linearregslope(value12,period1)>0 then
	count=count+1;

SIX_Sixsum=count;