{@type:indicator}

//settotalBar(60);

input: mode(1,"設定指標類型", inputkind:=Dict(["MACD",1],["KDJ",2],["RSI",3],["William",4],["BBI",5],["MTM",6],["六脈神劍",7]),quickedit:=true); //在同一程式畫4個指標

//===MACD
input: FastLength(12,"DIF短天數");
input: SlowLength(26, "DIF長天數");
input: MACDLength(9, "MACD天數");

var: DIF_V(0), MACD_V(0), OSC_V(0);

macd(weightedClose, FastLength, SlowLength, MACDLength, DIF_V, MACD_V, OSC_V);
	
if mode=1 then begin

	plot1(DIF_V,"DIF");
	plot2(MACD_V,"MACD");
	plot3(OSC_V,"OSC");

end;

//===KDJ
input: Length(9, "KDJ天數"), RSVt(3, "RSVt權數"), Kt(3, "Kt權數"), JType(0,"JType");

variable: _rsv(0), _k(0), _d(0), j(0);

Stochastic(Length, RSVt, Kt, _rsv, _k, _d);

if JType = 0 then
	j = 3 * _k - 2 * _d
else
	j = 3 * _d - 2 * _k; //J(%)

if mode=2 then begin

    plot11(_k,"K");
    plot12(_d,"D");
	plot13(j,"J");

end;

//===RSI
input: Length1(6, "RSI短天數"), Length2(12, "RSI長天數");

if mode=3 then begin

	plot21(RSI(Close, Length1),"RSI6");
	plot22(RSI(Close, Length2),"RSI12");

end;

//===William
input: Length_w1(14,"William短天數"), Length_w2(28,"William長天數");

value1 = PercentR(Length_w1) - 100;
value2 = PercentR(Length_w2) - 100;

if mode=4 then begin

	plot31(PercentR(Length_w1) - 100,"Willaim14");
	plot32(PercentR(Length_w2) - 100,"Willaim28");

end;

//===BBI
input: a1(3,"第一根均線天期"), a2(6,"第二根均線天期"), a3(12,"第三根均線天期"), a4(24,"第四根均線天期");

variable:BBI(0);

BBI=(average(close,a1)+average(close,a2)+average(close,a3)+average(close,a4))/4;

if mode=5 then begin

	plot41(BBI,"BBI");
	plot42(C,"收盤價");

end;

//===MTM
input: Length_mt1(5,"短動量天期");
input: Length_mt2(13,"長動量天期");

var: MTM1(0),MTM2(0);

value11 = Momentum(Close, Length_mt1); 

if CurrentBar >= Length_mt1 then
	Value12 = XAverage(Value11, Length_mt1)
else
	Value12 = Value11;
	
value21 = Momentum(Close, Length_mt2);	

if CurrentBar >= Length_mt2 then
	Value22 = XAverage(Value21, Length_mt2)
else
	Value22 = Value21;
	
MTM1= XAverage(Value12,3)/XAverage(XAverage(absValue(Value11), Length_mt1),3);
MTM2= XAverage(Value22,8)/XAverage(XAverage(absValue(Value21), Length_mt2),8);	

if mode=6 then begin

	plot51(MTM1,"MTM1");
	plot52(MTM2,"MTM2");

end;

if mode=7 then begin
   
   if OSC_V>0 then plot61(6,"MACD") else plot62(6,"MACD");
   if _k>_d then plot63(5,"KD") else plot64(5,"KD");
   if RSI(Close, Length1)>RSI(Close, Length2) then plot65(4,"RSI") else plot66(4,"RSI"); // Length1:6，Length2:12
   if value1>value2 then plot67(3,"William") else plot68(3,"William");
   if C>BBI then plot69(2,"BBI") else plot70(2,"BBI") ;
   if MTM1>MTM2 then plot71(1,"MTM") else plot72(1,"MTM");

end;

//=================================================//
{
condition100= (OSC_V cross over 0) and 
              (_k cross over _d) and
			  (RSI(Close, Length1) cross over RSI(Close, Length2)) and
			  (value1 cross over value2) and 
			  (C cross over BBI) and
			  (MTM1 cross over MTM2);

condition101= not((V+V[1]+V[2])/3<=500 and (C*V*1000+C[1]*V[1]*1000+C[2]*V[2]*1000)/3<=3000*10000);
 			  
if condition100 and condition101 then ret=1;		
}	  

