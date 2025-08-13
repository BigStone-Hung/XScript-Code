{@type:sensor|@guid:5769c305e5274bb8a4a51528b8b030de}
//變數區==================================
//input:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["損益",2],["指標",3]),quickedit:=true);
INPUT:TYPE(0);
//input:PIM(500000);//每檔交易資金
variable: TP(0),TQ(0),ID("");//交易價格/委託張數
variable:RA(0),RB(0);//預設開關
variable:KN(0),KNN(0),DH(0),DL(0),TT(0);//KNN 進場後KN
variable:MKP(0),BCOST(0),BOUT(0),BT(0),N_PL(0),S_PL(0),A_PL(0),WT(0),WRate(0);
VALUE1 = bollingerband(Close, 20, 2);
VALUE2 = bollingerband(Close, 20, -2);
VALUE3=((VALUE1-VALUE2)/average(close, 20))*100;
//CONDITION1=C[1]<=O[1] and C>O and V>Call_BV*1.618 and V>V[1]*1.2 and HIGHEST(V,3)=HIGHEST(V,5)
//			and trueAll(VALUE3>VALUE3[1],5) and average(VALUE3,13)[1]>average(VALUE3,13)[2];
CONDITION1=C>O[1] and V>Call_BV*1.5
			and trueAll(VALUE3[1]<VALUE3[2],8) and VALUE3[1]<VALUE3[2] and VALUE3>VALUE3[2];
//======================================
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
	IF H=HIghest(H,21) and LOWest(L,13)>BOUT then begin
		BOUT=LOWest(L,13); //多測測其他策略 8和13 此停利法似沒那麼穩定
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
	IF H=GetField("漲停價", "D") and L>BOUT then begin
		BOUT=L;
	END;
END;
KNN=KNN+1;
//動作區===========================================================
IF TYPE=1 and MKP[1]=0 and MKP[0]=1 then RET=1;
IF TYPE=2 and MKP[1]=1 and MKP[0]=0 then RET=1;

