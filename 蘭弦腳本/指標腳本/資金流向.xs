{@type:indicator|@guid:ec69cb0bd868426a9f4f85e2d376d88c}
input:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["損益",2],["指標",3]),quickedit:=true);

//變數區==================================
variable:RA(0),RB(0);//預設開關
variable:KN(0),KNN(0),DH(0),DL(0),TT(0);//KNN 進場後KN
variable:MKP(0),BCOST(0),BOUT(0),BT(0),N_PL(0),S_PL(0),A_PL(0),WT(0),WRate(0);
Value1 = GetField("資金流向");
Value2 = AVERage(Value1,21);
//VALUE3=GetField("投信持股比例", "D")+GetField("外資持股比例", "D");
CONDItion1=C>O and C[1]<O[1] and L>L[1] and C>=(H+L)/2 and Value1>Value2 and Value2[1]>Value1[1] and Value1=highest(Value1,13);
COndition2=V<CALL_BV*2 and V>CALL_BV;
//CONDITION3=VALUE3<VALUE3[1] and VALUE3[1]<VALUE3[2] and C<O and highest(H,2)=highest(H,5) and TRueAll(V>CAll_BV,2) and Call_BV>Call_BV[1];
//控制區==================================
IF MKP=0 and CONDItion1 and COndition2 then begin //
	MKP=1;
	BCOST=C;
	BOUT=C*0.92;
	//TP = AddSpread(Close, +2); 
	//TQ = floor(PIM / (TP * 1000));
	//setposition(TQ,label:="進多");	
END;
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
If plotmode=1 then begin
	If MKP[1]=0 and MKP=1 then plot11(BCost,"做多黃點",checkbox:=1);
	IF MKP[1]=1 then begin
	  plot12(BCost,"成本白線",checkbox:=1);
	  plot13(BOut,"移動黃線",checkbox:=1);
	End;
End;
If plotmode=2 then begin
	Plot20(0,"基準軸心");
	Plot21(BT,"交易次數"); 
	Plot22(Wrate,"交易勝率"); 
	Plot23(A_PL,"累計損益",checkbox:=0);	
	IF MKP<>0 then Plot24(N_PL,"浮動損益",checkbox:=1);
	IF MKP[1]=1 and MKP[0]=0 then Plot25(S_PL,"單次損益",checkbox:=1);
End;
If plotmode=3 then begin
 Plot31(Value1,"MFI柱圖");
 Plot32(Value2,"MFI青線");
 IF C[1]<O[1] and C>H[1] and V>Call_BV and Value2>Value2[1] and Value1[1]<Value2[1] and Value1[0]>Value2[0] then Plot33(1,"訊號") else Plot33(0,"訊號");
End;
