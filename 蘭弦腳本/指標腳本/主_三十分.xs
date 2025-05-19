{@type:indicator|@guid:a9e1267107d3456b8285f4260899d409}
//蘭氏趨勢線//plotline函數說明 //plotline(劃線序,起點K棒編號,起點價格,終點K棒編號,終點價格,"名稱",add/checkbox等選項)
//input:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["副圖",2]),quickedit:=true);
variable:i(0),H1(0),H2(0),H3(0),L1(0),L2(0),L3(0),H1Date(0), H1Time(0),L1Date(0), L1Time(0),H2Date(0),H2Time(0),L2Date(0),L2Time(0),H3Date(0),H3Time(0),L3Date(0),L3Time(0),ANO(1),AANO(1),H3NO(1),BNO(1),BBNO(1),BBBNO(1),SK(0),EK(0),SHP(0),EHP(0),SLP(0),ELP(0);

//變數區==================================
variable:RA(0),RB(0);//預設開關
variable:KN(0),KNN(0),DH(0),DL(0),TT(0);//KNN 進場後KN
variable:MKP(0),BCOST(0),BOUT(0),BT(0),N_PL(0),S_PL(0),A_PL(0),WT(0),WRate(0);
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
			//plotline(1,BNO-2,L1,ANO-2,H1, "小波線", add:=1);
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
				//plotline(2, ANO-2, H1, BNO-2,L1, "小浪線", add:=1);
				value71=2;
				value543=0	;
			End;
END;

CONDITION1=H>H1[1] and (L1=MINList(L1,L2,L3) or L2=MINList(L1,L2,L3));

IF MKP=0 and C>O and CONDITION1 and not(trueAny(CONDITION1[1],8)) and VALUE71=2 THEN BEGIN
	MKP=1;
	BCOST=C;
	BOUT=minList(LOWEST(L,3),C*0.97);
	//TP = AddSpread(Close, +2); 
	//TQ = floor(PIM / (TP * 1000));
	//setposition(TQ,label:="進多");	
End;
IF MKP=1 THEN BEGIN
	IF C<BOUT THEN BEGIN
		MKP=0;
		//setposition(0,label:="平多");
	END;
	IF H=HIghest(H,21) and LOWest(L,8)>BOUT then begin
		BOUT=LOWest(L,8);
	END;
	IF highest(H,3)/LOwest(L,3)>1.21 and TRueAny(L>H[1],2) and H*0.87>BOUT then begin
		BOUT=H*0.87;
	END;
	IF L>H[1] and V=highest(V,21) and L[1]>BOUT then begin
		BOUT=L[1];
	END;
	IF H/BCOST>1.21 and BCOST*1.03>BOUT then begin
		BOUT=BCOST*1.03;
	END;
END;
//回測區==========================================================================
IF MKP=1 then begin
	N_PL=(C-BCost)*1000;
End;
IF MKP<>1 and MKP[1]=1 then begin
	S_PL=((C-BCost)*1000)-(((BCOST+C)/2)*6);
	BT=BT+1;
	IF S_PL>0 then WT=WT+1;
	A_PL=A_PL+S_PL;
End;
Wrate=IFF (BT>0,WT/BT,0);
//視覺區==========================================================================
//If plotmode=1 then begin
	If MKP[1]=0 and MKP=1 then plot11(BCost,"做多黃點",checkbox:=1);
	IF MKP[1]=1 then begin
	  plot12(BCost,"成本白線",checkbox:=1);
	  plot13(BOut,"移動黃線",checkbox:=1);
	End;
//End;
