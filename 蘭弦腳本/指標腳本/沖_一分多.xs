{@type:indicator|@guid:5a2ebbe7096149f6a17a1f237cf83a08}
input:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["損益",2]),quickedit:=true);
//策略適用:現貨/空方/1分K
variable:RA(0),RB(0);//預設多重開關
variable:KN(0),KNN(0),PH(0),DH(0),DL(0),VH(0),VL(0),TT(0);//KNN 進場後KN
variable:MKP(0),BCOST(0),BOUT(0),BT(0),N_PL(0),S_PL(0),A_PL(0),WT(0),WRate(0);
//==================================================================
IF DATE<>DATE[1] then 
	begin
		TT=0;
		KN=1;
		RA=0;RB=0;
		DH=H;DL=L;VH=V;VL=V;PH=GetField("均價");	
	End
ELSE
	Begin
		KN=KN+1;
		IF H>DH[1] then DH=H;
		IF L<DL[1] then DL=L;
		IF V>VH[1] then VH=V;
		IF V<VL[1] then VL=V;
		IF GetField("均價")>PH then PH=GetField("均價");
		IF H=L then begin
			RA=RA+1;
		END;
		IF O>GetField("均價")*1.01 and C<GetField("均價")*1.01 then begin
			RB=RB+1;
		END;
	End;	
Value1=GetField("成交金額(元)");
Value2=average(GetField("成交金額(元)"),KN);		
//Value31=GetField("買進大單金額")-GetField("賣出大單金額")+GetField("買進特大單金額")-GetField("賣出特大單金額");
//===============================================================================
CONDITION1= Time>090200 and time<123000 and C<GetField("參考價", "D")*1.08 and OPEND(0)>CLOSED(1);		
CONDITION2= RA=0 and C=H and C>DH[1] and (VALUE1>VALUE2 or VALUE2>VALUE2[1]);
//====================================
CONDITION4= H=DH and IFF(MKP=1,(H-BCost)/BCost,0)>0.03;	
CONDITION5= V>Call_BV*3.4 and VALUE1>VALUE2*3.4;
CONDITION8= TRUEAll(C>O,2) and V>VH[1];
//=========================================================
CONDITION9= time=131700 or H=GetField("漲停價", "D") or C<BOut;
Condition10=GetSymbolField("TSE.TW", "收盤價", "D")>GetSymbolField("TSE.TW", "開盤價", "D");
Condition11=GetSymbolField("TSE.TW", "收盤價", "D")>GetSymbolField("TSE.TW", "收盤價", "D")[1];		
//邏輯與部位控制區======================================================================
IF MKP=1 then begin
	If CONDITION9 then begin
		MKP=0;
		//setposition(0,label:="當沖_平多");	
	End;
	IF CONDITION4[1] and C<O and BCOST*1.013>BOUT then begin
		BOUT=BCOST*1.013;
	End;
	IF CONDITION5 and LOWEST(L,3)>BOUT then begin
		BOUT=LOWEST(L,3);
	End;
End;
//IF Condition10 and Condition11 then begin 
	IF GetSymbolInfo("買賣現沖")=true then begin  //and RA<=1 
		If MKP=0 and CONDITION1 and CONDITION2 and C>DH[1] then begin
			MKP=1;
			BCOST=C;
			BOUT=L[1];
			//BOUT=GetField("均價")*0.99;
			TT=TT+1;
			//TP = AddSpread(Close, +2); 
			//TQ = floor(PIM / (TP * 1000));
			//setposition(TQ,label:="當沖_進多");		
		End;
	END;
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
	If MKP[1]=0 and MKP=1 then plot11(BCost,"做多點",checkbox:=1);
	IF MKP[1]=1 then begin
	  plot12(BCost,"成本紫線",checkbox:=1);
	  plot13(BOut,"移動紫線",checkbox:=1);
	End;
End;
If plotmode=2 then begin
 Plot30(0,"零軸");
 IF MKP[1]=1 then Plot31(N_PL,"單次損益",checkbox:=1);
 Plot32(A_PL,"累計損益",checkbox:=1);
 Plot36(BT,"多方次數");
 Plot37(Wrate,"勝率");
End;
