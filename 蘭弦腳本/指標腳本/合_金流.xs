{@type:indicator|@guid:09dc97c9277c40678c5615aee6f3ea7e}
input:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["損益",2],["指標",3]),quickedit:=true);
variable:MKP(0),BCOST(0),BOUT(0),BT(0),N_PL(0),S_PL(0),A_PL(0),WT(0),WRate(0);
//自定義條件================================================================================
VALUE1=GetField("資金流向");
VALUE2=MAXList(average(VALUE1,8),average(VALUE1,13),average(VALUE1,21));
VALUE3=BIAS(3)+BIAS(5)+BIAS(8);
CONDITION1= C>C[1] and C>(H+L)/2 and TRUEAll(VALUE1>VALUE1[1],2) and trueAll(VALUE1>VALUE2,2) and VALUE2>VALUE2[1];
CONDITION2= C>O[2] and trueAll(VALUE2>VALUE2[1] and VALUE1>VALUE2,3);	
CONDITION9= H>highest(H[1],89);
//部位控制================================================================================
IF VALUE1>0.8 and MKP=0 and (CONDITION1 or CONdition2) and Call_B55>0 then begin
	MKP=1;
	BCOST=C;
	BOUT=maxList(lowest(L,5),BCOST*0.95);
End;
IF MKP=1 then begin
	IF C<BOUT then MKP=0;
	IF CONDITION9 and H*0.92>BOUT then begin
		BOUT=H*0.92;
	END;
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
	If MKP[1]=0 and MKP[0]=1 then plot11(BCost,"出手黃點");
	IF MKP[0]=1 then begin
	  plot12(BCost,"多方成本");//黃色線段
	  plot13(BOut,"多方移動");//白色線段
	End;
End;

If plotmode=2 then begin
 //Plot20(0,"白色零軸",checkbox:=0);
 IF MKP[1]=1 then Plot21(N_PL,"單次損益",checkbox:=0);
 Plot23(A_PL,"累計損益",checkbox:=1);
 Plot24(BT,"多方次數");
 Plot25(Wrate,"多方勝率");
End;

If plotmode=3 then begin
	PLOT30(VALUE2,"平均淡藍",checkbox:=1);
	PLOT31(VALUE1,"資金流向");
	PLOT32(VALUE2,"平均資金",checkbox:=1);	
	IF (CONdition1 or CONdition2) and not(trueany(CONdition1[1],2) or trueany(CONdition2[1],2)) then PLOT33(VALUE2,"黃色訊號") ELSE PLOT33(0,"黃色訊號");
END;
