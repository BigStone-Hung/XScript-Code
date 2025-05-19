{@type:indicator|@guid:8cfa7484116248cda77fc1e2fa8f9f09}
//自定義區================================================================================
input:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["損益",2],["指標",3]),quickedit:=true);
variable:I(0),MKP(0),BCOST(0),BOUT(0),BT(0),N_PL(0),S_PL(0),A_PL(0),WT(0),WRate(0);
VALUE5=AVERAGE(C,5);
VALUE8=AVERAGE(C,8);
VALUE21=AVERAGE(C,21);
VALUE91=absValue(VALUE5-VALUE21);
CONDITION1=O<VALUE8 and C>VALUE8 and (O+C)/2>VALUE8 and VALUE5>VALUE5[1];
CONDITION2=trueAll(VALUE91[1]<VALUE91[2] and VALUE5[1]<VALUE21[1],2) and VALUE21>VALUE21[1] and C>MAXList(O[1],C[1]) and C>O;
CONDITION3=(VALUE21>VALUE21[1] or VALUE21=minList(VALUE5,VALUE8,VALUE21)) and VALUE21<>maxList(VALUE5,VALUE8,VALUE21);
CONDITION9=VALUE5=maxList(VALUE5,VALUE8,VALUE21) and VALUE5>VALUE5[1] and VALUE8>VALUE8[1] and VALUE21>VALUE21[1];
CONDITION99=C<BOUT;
//部位控制================================================================================
IF MKP=1 then begin
	IF CONDITION99 then MKP=0;
	IF CONDITION3 and Call_MB>BOUT then begin
		//BOUT=Call_MB;
	END;
	IF trueAll(L>Call_MB,8) and Call_MB[1]>BOUT then begin
		BOUT=Call_MB[2];
	END;
End;
IF MKP=0 and ((CONDITION1 and not(CONDITION9[1])) or (CONDITION2 and not(CONDITION9))) and CONDITION3 then begin
	IF Call_B55>0 and Call_BV>Call_BV[1] and V>Call_BV[1] and (C-O)>(H-C) and V>V[1] and GetField("成交金額(元)", "D")>10000000 then begin
		MKP=1;
		BCOST=C;
		BOUT=C*0.92;
	End;
End;
//回測段=================================================================================
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
//視覺設計==============================================
If plotmode=1 then begin
	plot10(Call_MB,"融資成本");
	If MKP[1]=0 and MKP[0]=1 then plot11(BCost,"出手買點");
	IF MKP[0]=1 then begin
	  plot12(BCost,"多方成本");
	  plot13(BOut,"多方移動"); 
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
	//PLOT30(VALUE11,"融資餘額");
	//PLOT31(VALUE12,"近期資買");
	//PLOT32(VALUE13,"近期資賣");
	//PLOT33(VALUE12-VALUE13,"近期差額");		
END;
