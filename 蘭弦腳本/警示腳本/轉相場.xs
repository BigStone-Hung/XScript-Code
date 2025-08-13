{@type:sensor|@guid:ec0604993df74205a6b56ff36870b1a9}
INPUT:TYPE(0);
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
	IF Call_55B>0 and Call_BV>Call_BV[1] and V>Call_BV[1] and (C-O)>(H-C) and V>V[1] and GetField("成交金額(元)", "D")>10000000 then begin
		MKP=1;
		BCOST=C;
		BOUT=C*0.92;
	End;
End;
//=============================================
IF TYPE=1 and MKP[1]=0 and MKP[0]=1 then RET=1;
IF TYPE=2 and MKP[1]=1 and MKP[0]=0 then RET=1;