{@type:function}
// XQ: 費雪指標_超級趨勢
SetBarMode(2);
input: ratio1(numeric); SetInputName(1, "參數");  //ATRLength(numeric), // 10
input: Period1(numeric); SetInputName(2, "天期"); //ATRMult(numeric); // 1.5

variable:
	SuperL(0),
    SuperH(0),
    trend(1),
    flagL(0),
    flagH(0),
    SuperTrend(0);

SuperH = (H+L)/2 + Period1*ATR(ratio1);
SuperL = (H+L)/2 - Period1*ATR(ratio1);
 
if close > SuperH[1] then
trend = 1
else if close < SuperL[1] then
trend = -1; 

if trend < 0 and trend[1] > 0 then
flagL=1
else flagL=-1;
if trend > 0 and trend[1] < 0 then
flagh = 1
else flagh = -1; 

if trend > 0 and SuperL < SuperL[1] then SuperL=SuperL[1];
if trend < 0 and SuperH > SuperH[1] then SuperH=SuperH[1];
if flagL = 1 then SuperH = (H+L)/2 + Period1*ATR(ratio1);
if flagh = 1 then SuperL = (H+L)/2 - Period1*ATR(ratio1); 

FTI_SuperTrend = trend;