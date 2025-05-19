{@type:indicator|@guid:822c1e9fa40b4cb7884f3344e85fe206}
input:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["損益",2],["副圖",3]),quickedit:=true);
//變數區==================================
variable:RA(0),RB(0);//預設開關
variable:KN(0),KNN(0),TT(0);//KNN 進場後KN
variable:MKP(0),BCOST(0),BOUT(0),BT(0),N_PL(0),S_PL(0),A_PL(0),WT(0),WRate(0);
VALUE1=AVERage(C,5);
VALUE2=AVERage(C,13);
VALUE3=AVERage(C,21);
CONDITION1=V=HIghest(V,13) and C>H[1] 
	and C>MAXList(VALUE1,VALUE2,VALUE3) 
	and L<MAXList(VALUE1,VALUE2,VALUE3)
	and L[1]<MAXList(VALUE1[1],VALUE2[1],VALUE3[1]);
CONDITION2=VALUE1>VALUE1[1] and VALUE2>VALUE2[1] and VALUE3>VALUE3[3];
//========================================================================
IF MKP=0 and CONDItion1 and COndition2 and not(condition2[2])then begin //
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
	IF (trueAll(C>O,3) or trueAll(H>H[1],2)) and H=HIGHEST(HIGH,8) and L[2]>BOUT then begin
		BOUT=L[2];
	END;
	IF trueAll(condition2,3) and trueAll(VALUE2>VALUE2[1],3) and VALUE2>BOUT then begin
		BOUT=VALUE2;
	END;
	IF H>BCOST*1.5 and BCOST*1.5>BOUT then begin
		BOUT=BCOST*1.5;
	END;
	IF H>H[1] and H>BOUT*1.33 and L>BOUT then begin
		BOUT=L;
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
 Plot20(0,"基準零軸");
 IF MKP<>0 then Plot21(N_PL,"浮動損益",checkbox:=1);
 IF MKP[1]<>0 and MKP<>MKP[1] then Plot22(N_PL,"出場損益",checkbox:=1);
 Plot23(A_PL,"累計損益",checkbox:=0);
 Plot26(BT,"多方次數");
 Plot77(Wrate,"交易勝率");
End;
If plotmode=3 then begin
 //Plot31(Value1,"MFI白柱");
 //Plot32(Value2,"MFI黃線");
End;




