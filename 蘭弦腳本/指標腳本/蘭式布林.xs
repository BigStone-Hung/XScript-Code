{@type:indicator|@guid:b6ae0b5a0f75428fb1bdda691aee46ae}
//變數區==================================
INPUT:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["損益",2],["指標",3]),quickedit:=true);
//INPUT:TYPE(0);
//INPUT:PIM(500000);//每檔交易資金
variable: TP(0),TQ(0),ID("");//交易價格/委託張數
variable:RA(0),RB(0);//預設開關
variable:KN(0),KNN(0),DH(0),DL(0),TT(0);//KNN 進場後KN
variable:MKP(0),BCOST(0),BOUT(0),BT(0),N_PL(0),S_PL(0),A_PL(0),WT(0),WRate(0);
VALUE1 = bollingerband(Close, 20, 2);
VALUE2 = bollingerband(Close, 20, -2);
VALUE3=((VALUE1-VALUE2)/average(close, 20))*100;
//CONDITION1=C[1]<=O[1] and C>O and V>Call_BV*1.618 and V>V[1]*1.2 and HIGHEST(V,3)=HIGHEST(V,5)
//			and trueAll(VALUE3>VALUE3[1],5) and average(VALUE3,13)[1]>average(VALUE3,13)[2];
//CONDITION1=C>O[1] and HIGHEST(V,3)=HIGHEST(V,5) and BIas(55)<34
//			and VALUE3>average(VALUE3,13) and VALUE3[1]<average(VALUE3,13)[1];
CONDITION1=C>O[1] and V>Call_BV*1.5
			and trueAll(VALUE3[1]<VALUE3[2],8) and VALUE3[1]<VALUE3[2] and VALUE3>VALUE3[2];
//邏輯區======================================
IF MKP=0 and CONDItion1 then begin //
	KNN=1;
	MKP=1;
	BCOST=C;
	BOUT=MAXList(C*0.92,VALUE2);
	//RET=1;
	//TP = AddSpread(Close, +2); 
	//TQ = floor(PIM / (TP * 1000));
	//setposition(TQ,label:="進多");	
END;
IF MKP=1 THEN BEGIN
	IF C<BOUT THEN BEGIN
		KNN=0;
		MKP=0;
		//setposition(0,label:="平多");
	END;
	IF KNN>3 and C>O and C=HIghest(C,13) and H>VALUE1 and (VALUE1+average(close, 20))/2>BOUT and (VALUE1+average(close, 20))/2>BCOST then begin
		BOUT=(VALUE1+average(close, 20))/2;
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
KNN=KNN+1;
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
	PLOT31(VALUE3,"差值%");
	IF average(VALUE3,13)>average(VALUE3,13)[1] then PLOT32(average(VALUE3,13),"平均值+") else PLOT33(average(VALUE3,13),"平均值-");
End;
