{@type:filter|@guid:dd057ec265704667a0a6742536d33101}
setbarfreq("AD");
settotalbar(89);
variable:ANO(1),AANO(2),AAANO(3),BNO(1),BBNO(2),BBBNO(3);
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
value336=value7-(ANO*value335);
value337=value337+1;
//====================================================
Condition1=C>value336 and O<VALUE336;
IF C>O and Condition1 then begin
		RET=1;
End;