{@type:function_bool|@guid:e131612a918b423090f188d42a87dd8f}
SetBarMode(0);// XQ: 外盤動能V型E5
input: ratio1(numeric); SetInputName(1, "DMI參數");
input: Period1(numeric); SetInputName(2, "天期");
input: Period2(numeric); SetInputName(3, "點數");

variable: up(0), down(0), mid(0),up1(0),down1(0),mid1(0),up2(0), down2(0);
variable: pb(0),ydn_dif(0),ydn_pb(0),ydntrend(0),ydntrend_dif(0),ydntrend_pb(0),
          c_ydn_pbdif(0),c_ydntrend_pbdif(0);
variable: startdate(0),enddate(0);
variable: Longstop(0),Shortstop(0),barH(0),iRate100(0);
variable: bflag(0),bflag2(0),sflag(0),sflag2(0),hbflag(0),hsflag(0),bprice(0),Tbprice(0),bprice1(0),bprice2(0),sprice1(0),sprice2(0),sprice(0),
         profit(0),Pprofit(0),Lprofit(0),Tprofit(0),BTprofit0(0),BTprofit(0),STprofit(0);
variable: count(0),scount(0),count1(0),count2(0),count3(0),Tcount(0),countx(0),county(0),Pcount(0),Lcount(0),Mcount(0),xcount(0),
         yieldratio(0),plratio(0),ProfitFactor(0);		 

startdate = f1_startdate2;
enddate = f1_enddate2;

//原理與公式..............................................................................
value1=getfield("外盤量");
value2=getfield("內盤量");
value3=summation(value1,Period1);  //最佳化值period1
value4=summation(value2,Period2);  //最佳化值period1
if value4<>0 then 
value5=value3/value4;
value6=average(value5,ratio1);    //ydn_ma
ydn_dif=value5-value6;             //ydn_dif

up1 = bollingerband(value5, 20, 2);
down1 = bollingerband(value5, 20, -2);
if up1 - down1 = 0 then ydn_pb = 0 else ydn_pb = (value5 - down1) * 100 / (up1 - down1);  //ydn_pb
c_ydn_pbdif=pb-ydn_pb;             //pb-ydn_pb
//ydntrend...................
value8=value3-value4;
ydntrend=value8+ydntrend[1];
value9=average(ydntrend,ratio1);        //ydntrend_ma
ydntrend_dif=ydntrend-value9;          //ydntrend_dif

up2 = bollingerband(value9, 20, 2);
down2 = bollingerband(value9, 20, -2);        
if up2 - down2 = 0 then ydntrend_pb = 0 else ydntrend_pb = (value9 - down2) * 100 / (up2 - down2);  //ydntrend_pb
c_ydntrend_pbdif=pb-ydntrend_pb;             //pb-ydntrend_pb
//pb.........................
up = bollingerband(c, 20, 2);
down = bollingerband(c, 20, -2);        
if up - down = 0 then pb = 0 else pb = (c - down) * 100 / (up - down); //pb              
//...........................
Longstop=Lowest(close[1],5);      
Shortstop=highest(close[1],5);               
value13= SAR(0.02, 0.02, 0.2);
//...........................
Value121 = GetField("時間");  
count=0; scount=0;

//..........................................................................................................
YDN_trendU= (value9>value9[1]);
