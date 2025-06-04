{@type:function|@guid:f763be2905c3426a96049ce19d14ed74}
SetBarMode(1);// XQ: sar20

variable: count(0),rsv(0),k(0), _d(0), j(0);
variable: up(0), down(0), mid(0);
variable: shortaverage(0);
variable: midaverage(0);
variable: Longaverage(0);
variable: AvgHLp(0),AvgH(0),AvgL(0);
variable: sumUp(0), sumDown(0),RS(0);
variable: pdi(0), ndi(0), adxx(0);
variable: bv(0),bva(0);
variable: up1(0),down1(0),mid1(0),bbandwidth(0);

count=0;
//1.創一年新高股.....................................................................
value11 = highest(high, 250-1);
if high >= value11 and volume >= 1000 
then count=count+1;

//2.高帶寬擴大........................................................................
up = bollingerband(Close, 20, 2);
down = bollingerband(Close,20, -1 * 2);
if up - down = 0 then value21 = 0 else value21 = (close - down) * 100 / (up - down);
value22=(up-down)*100/ema(close,20); //帶寬
condition2 = value22>value22[1] and value22[1]=lowest(value22[1],3); 
Condition3 = average(close,20)>average(close[1],20);
Condition4 = close > close[20]*1.015;
if condition4 and condition2 and condition3 and volume>500 then
count=count+1;

//3.突破糾結均線股........................................................................
shortaverage = average(close,5);
midaverage = average(close,10);
Longaverage = average(close,20);		
AvgH = maxlist(shortaverage,midaverage,Longaverage);
AvgL = minlist(shortaverage,midaverage,Longaverage);
if AvgL > 0 then AvgHLp = 100*AvgH/AvgL -100;
condition6 = trueAll(AvgHLp < 5,20);
condition7 = V > average(V[1],20)*(1+25/100) ;
condition8 = C > AvgH *(1.02) and H > highest(H[1],20);
condition9 = average(volume[1], 5) >= 1000; 
if condition6 and condition7 and condition8 and condition9
then count=count+1;

//4.多頭轉強股........................................................................
if CurrentBar = 1 then  begin
    sumUp = Average(maxlist(close - close[1], 0), 10);
    sumDown = Average(maxlist(close[1] - close, 0), 10);
end else begin
	up = maxlist(close - close[1], 0);
	down = maxlist(close[1] - close, 0);
    sumUp = sumUp[1] + (up - sumUp[1]) / 10;
	sumDown = sumDown[1] + (down - sumDown[1]) / 10;
end;
if sumdown<>0
then rs=sumup/sumdown;
if rs crosses over 4
and close<close[3]*1.06
//最近3日漲幅小於6%
and Average(Volume[1], 100) >= 500
//成交量判斷
then count=count+1;

//5.SAR指標.....................................................................
value61 = SAR(0.02, 0.02, 0.2);       
value62 = MACD(WeightedClose,12,26,9,value65,value66,value67);  
condition10 = c>c[20]*1.025 and average(close,20)>value61 and close>average(c,20) and value67>0;
if condition10  then count=count+1;

//6.RSI指標買進股...........................................................................
value71=RSI(close,5);
value72=RSI(close,10);
condition11 = average(close,20)>average(close[1],20) and volume > 1000;
condition12 = value71<55 and value71>35;
Condition13 = value71<value71[1] and value71[1]<=value71[2]+1 and value71[1]>=value71[2]-1 and value71[2]<value71[3];
condition14 = (value71>value71[1] and value71[2]>value71[1]) or (value72>value72[1] and value72[2]>value72[1]);  //v反轉
condition15 = value71-value72<-10;
condition16 = value71>value72 and value71[1]<value72[1];
if condition11 and (condition12 or condition13 or condition14 or condition15 or condition16)
then count=count+1;

//7.KD指標買進股........................................................................
Stochastic(9, 3, 3, rsv, k, _d);
condition17= highest(h,1)> highest(h[1],1)
and close>close[1]
and ((k>k[1]and k[1]<k[2])or(_d>_d[1]and _d[1]<_d[2]))
and average(close,20)>average(close[1],20) and v>=500;
if condition17 
then count=count+1;

//8.DMI指標股.....................................................................
value73 = DirectionMovement(14, pdi, ndi, adxx); //計算14期的DMI指標
condition18 = pdi>ndi and  pdi[1]<ndi[1];
Condition19 = DMI_DevB(50,14)>0 ;
if (condition18  or  condition19) and v>=500
 then count=count+1;

AI_Score1_1=count;	 