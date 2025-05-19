{@type:filter|@guid:edfe91e2a80e498aa2e2f12ea25afca6}
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
Condition1=value777>=value77 and value77>=value7;
condition2=minlist(O,C)>maxlist(O[1],C[1]);
IF C>O and V>V[1] and (C-O)>(H-C) and (C[1]>=C[2] or L[1]>L[2]) and L>(H[1]+L[1])/2 then begin //and value777-value77>=value77-value7 
	If Condition1 and Condition2 and L[1]<value336 and L<value7 then begin//
		RET=1;
	End;
End;