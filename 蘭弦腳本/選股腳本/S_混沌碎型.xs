{@type:filter|@guid:49bd7b25a3cb496eb296f7d7635d7ad7}
setbarfreq("AD");
settotalbar(55);
variable:ANO(1),AANO(2),AAANO(3),BNO(1),BBNO(2),BBBNO(3);
If value71=1 and H[2]>value7 then// VALUE71開關
	begin		
		value71=0;
	End;
If value71=0 and L[2]<value8 then
	begin
		value71=1;
	End;
If high[2] = highest(high,5) and (value71=0 or H>value7) and H<H[2] then	
	BEGIN
		value777=value77;
		value77=value7;
		value7 = H[2];//;
		AAANO=AANO;
		AANO=ANO;
		ANO=currentbar;
		value71=1;
		value337=1;
	End;
If low[2]=lowest(low,5) and (value71=1 or L<value8) and L>L[2] then
	begin
		value888=value88;
		value88=value8;
		value8=low[2];//low[2];
		BBBNO=BBNO;
		BBNO=BNO;
		BNO=currentbar;
		value71=0;
		value337=0;
	End;
value333=ANO-AAANO;//時間
value334=value7-value777;
value335=Round(value334/value333,2);
value336=value7-((55-ANO)*value335);
value337=value337+1;
//====================================================
Condition1=value777>=value77 and value77>=value7;
IF V>100 and Condition1 and call_55W>0 then begin
	If O<value336 and C>value336 then RET=1;
End;
outputfield1(value777,"A");
outputfield2(value7,"A");
outputfield3(value336,"A");
outputfield4(ANO,"A");
outputfield5(currentbar,"A");




