{@type:filter|@guid:d2e4e9efeef64eca81afd056e0e53927}
setbarfreq("AD");
settotalbar(55);
variable: ADate(0), ATime(0),BDate(0), BTime(0),AADate(0),AATime(0),BBDate(0),BBTime(0),AAADate(0),AAATime(0),BBBDate(0),BBBTime(0);
variable:ANO(1),AANO(1),AAANO(1),BNO(1),BBNO(1),BBBNO(1);
If value71=1 and H[2]>value7 then// VALUE71開關
	begin		value71=0;
		ADate = date[2];
	End;
If value71=0 and L[2]<value8 then
	begin
		value71=1;
		BDate=date[2];
	End;
If high[2] = highest(high,5) and (value71=0 or H>value7) and H<H[2] then	
  BEGIN
	  value777=value77;
	  value77=value7;
	  value7 = high[2];
	  AAADate=AADate;
	  AAATime =AATime ;
	  AAANO=AANO;
	  AADate=ADate;
	  AATime =ATime ;
	  AANO=ANO;
	  ADate = date[2];
	  //ATime = time[2]  ;
	  ANO=currentbar;
	  value333=ANO-AAANO;//時間
	  value334=value7-value777;
	  //vlue335=Round(value334/value333,2);
	  value336=H[2];
	  value337=1;
	  If (ADate>BDate or (ADate=BDate and ATime>Btime)) then
		begin
			//PLOT1(VALUE7,"波");
			value71=1;
			value543=value543+1;
		End;
	End;
If low[2]=lowest(low,5) and (value71=1 or L<value8) and L>L[2] then
	begin
		value888=value88;
		value88=value8;
		value8=low[2];
		BBBDate=BBDate;
		BBBTime=BBTime;
		BBBNO=BBNO;
		BBDate=BDate;
		BBTime=BTime;
		BBNO=BNO;
		BDate=date[2];
		//BTime=time[2] ;
		BNO=currentbar;
		value433=BNO-BBBNO;
		value434=value8-value888;
		//value435=Round(value434/value433,2);
		value436=L[2];
		value437=1;
		If (BDate>ADate or (BDate=ADate and BTime>Atime)) then
			BEGIN
				//PLOT1(VALUE8,"頸");
				value71=0;
				value543=0;
			End;
	eND;
value337=value337+1;
value437=value437+1;
{
IF VALUE8<VALUE88 and VALUE7<VALUE77 
and C>VALUE88 AND percentr(55)-50>0
then RET=1;
}
If C>O and V>100 and GetField("股本(億)","D")<100 and GetField("股本(億)","D")>3
	and value88<value888 and value88<value8 
	and value7>value77 and VALUE77>maxlist(value8,value88,value888) 
	and O<value7 and C>value7 and value7<>maxlist(value7,value77,value777) 
then ret=1;

outputfield1(value8,"8");
outputfield2(value88,"88");
outputfield3(value888,"888");


