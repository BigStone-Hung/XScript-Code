{@type:indicator|@guid:8d26ecd0df334bdaac963e5cadf332f0}
//純技術面之最基本核心基礎  蘭弦閱讀混沌理論碎形後開發
variable:i(0),H1(0),H2(0),H3(0),L1(0),L2(0),L3(0),H1Date(0), H1Time(0),L1Date(0), L1Time(0),H2Date(0),H2Time(0),L2Date(0),L2Time(0),H3Date(0),H3Time(0),L3Date(0),L3Time(0),ANO(1),AANO(1),H3NO(1),BNO(1),BBNO(1),BBBNO(1),SK(0),EK(0),SHP(0),EHP(0),SLP(0),ELP(0);
//=================================================================================================================================================
If H[2]=highest(high,5) and (value71=2 or H[2]>=H1) then	
  BEGIN
	  H3=H2; H2=H1; H1 = high[2];
	  H3Date=H2Date; H2Date=H1Date; H1Date = date[2];
	  H3Time=H2Time; H2Time =H1Time; H1Time = time[2];
	  H3NO=AANO; AANO=ANO; ANO=currentbar;
	  value333=ANO-H3NO;//時間
	  value334=H1-H3;
	  value336=H[2];
	  value337=1;
	  If (H1Date>L1Date or (H1Date=L1Date and H1Time>=L1Time)) then
		begin
			plotline(1,BNO-2,L1,ANO-2,H1, "小波線", add:=1);
			value71=1;
			value543=value543+1;
		End;
	End;
If L[2]=lowest(low,5) and (value71=1 or L[2]<L1) then
	begin
		L3=L2; L2=L1; L1=low[2];
		L3Date=L2Date; L2Date=L1Date; L1Date=date[2];
		L3Time=L2Time; L2Time=L1Time; L1Time=time[2] ;
		BBBNO=BBNO;	BBNO=BNO; BNO=currentbar;
		value433=BNO-BBBNO;
		value434=L1-L3;
		value436=L[2];
		value437=1;
		If (L1Date>H1Date or (L1Date=H1Date and L1Time>=H1Time)) then
			BEGIN
				plotline(2, ANO-2, H1, BNO-2,L1, "小浪線", add:=1);
				value71=2;
				value543=0	;
			End;
END;
