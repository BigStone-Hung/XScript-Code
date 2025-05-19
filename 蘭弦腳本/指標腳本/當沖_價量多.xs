{@type:indicator|@guid:a2343c5550b04ff0ab7b91dc77bd46a4}
input:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["損益",2]),quickedit:=true);
//策略適用:現貨/空方/1分K
variable:RA(0),RB(0);//預設多重開關
variable:KN(0),KNN(0),DH(0),DL(0),TT(0),JVA(0),JVB(0);//KNN 進場後KN
variable:MKP(0),BCOST(0),BOUT(0),BT(0),N_PL(0),S_PL(0),A_PL(0),WT(0),WRate(0);
//邏輯區======================================================================
IF DATE<>DATE[1] then 
	begin
		TT=0;
		KN=1;
		RA=0;RB=0;
		DH=H;DL=L;	
	End
ELSE
	Begin
		KN=KN+1;
		IF H>DH[1] then DH=H;
		IF L<DL[1] then DL=L;	
		IF H=L then begin
			RA=RA+1;
		END;
		IF H<GetField("均價") then begin
			RB=RB+1;
		END;
		JVB=(GetField("成交量", "D"));
	End;
//=============================================================================================================================================================
CONDITION1= Time>=090000 and C<GetField("參考價", "D")*1.05 and C>GetField("均價") and C>CLOSED(1);		
CONDITION2= Time<=093500 and JVB>=GetField("成交量", "D")[1]/3 and JVB[1]<GetField("成交量", "D")[1]/3;
CONDITION3= Time<=101500 and JVB>=GetField("成交量", "D")[1]/2 and JVB[1]<GetField("成交量", "D")[1]/2;	
//==================================================
CONDITION4= H=DH and IFF(MKP=1,(H-BCost)/BCost,0)>0.03;	
CONDITION5= H=DH and L>GetField("參考價", "D")*1.04 and BCOST<C*0.985;
CONDITION6= H=DH and H>GetField("參考價", "D")*1.08;
CONDITION7= H=DH and H>BOUT*1.03;
//=============================================================================================
CONDITION9= time=131700 or H=GetField("漲停價", "D") or C<BOut;
//=============================================================================================
Condition10=GetSymbolField("TSE.TW", "收盤價", "D")>GetSymbolField("TSE.TW", "開盤價", "D");
Condition11=GetSymbolField("TSE.TW", "收盤價", "D")>GetSymbolField("TSE.TW", "收盤價", "D")[1];		
//部位控制區===================================================================================
IF MKP=1 then begin
	If CONDITION9 then begin
		MKP=0;
		//setposition(0,label:="沖多_平");	
	End;
	IF CONDITION4[1] and C<O and BCOST*1.013>BOUT then begin
		BOUT=BCOST*1.013;
	End;
	IF (CONDITION5 or CONDITION6) and GetField("均價")>BOUT then begin
		BOUT=GetField("均價");
	END;
	IF CONDITION7 and C>O and H*0.98>BOUT then begin
		BOUT=H*0.98;
	End;
End;
//IF Condition10 or Condition11 then begin //
IF GetSymbolInfo("買賣現沖")=true then begin
	IF MKP=0 then begin  
		If CONDITION1 and ((CONDITION2 and RA<5) or CONDITION3) then begin
			If not((C[1]>O[1] and L>H[1]) or (V>Call_BV*2 and V[1]>Call_BV[1]*2)) then begin
				MKP=1;
				BCOST=C;
				BOUT=C*0.98;
			End;
		END;
	END;
End;
//End;
//回測段==========================================================================
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
//視覺設計==========================================================================
If plotmode=1 then begin
	IF Time=090000 and DATE<CURRENTDATE then plot1(25000,"跨日黃框") Else noPlot(1);	
	IF Time=090000 then plot1(25000,"跨日黃框") Else noPlot(1);	
	IF DAte=DAte[1] then begin
		PLOT2(GetField("均價"),"基本均價");
		//PLOT3(GetQuote("均價"),"均價",checkbox:=1);
	End;
	If MKP[1]=0 and MKP[0]=1 then plot11(BCost,"出手紫點",checkbox:=1);
	IF MKP[1]=1 then begin
	  IF BOUT<BCost then plot12(BCost,"成本紫線",checkbox:=1);
	  plot13(BOut,"移動紫線",checkbox:=1);
	End;
	//IF DATE=CURRentDate then begin
		PLOT14(GetField("參考價", "D")*1.00);
		PLOT15(GetField("參考價", "D")*1.02);
		PLOT16(GetField("參考價", "D")*1.04);
		PLOT17(GetField("參考價", "D")*1.06);
		PLOT18(GetField("參考價", "D")*1.08);
		PLOT19(GetField("參考價", "D")*1.10);
	//END;
	IF (V>Call_BV*2 and V[1]>Call_BV[1]*2) and (trueAll(C>O,2) or trueAll(C<O,2)) then PLOT99(H*1.005,"觀察重點");
	
End;
If plotmode=2 then begin
 Plot30(0,"零軸");
 IF MKP[1]=1 then Plot31(N_PL,"單次損益",checkbox:=1);
 Plot32(A_PL,"累計損益",checkbox:=1);
 Plot36(BT,"多方次數");
 Plot37(Wrate,"勝率");
End;
