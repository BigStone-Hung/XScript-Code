{@type:filter|@guid:d7d8dca5fc394866a80c3402c3b574ba}
SETBarFreq("D");
SETTOtalBar(21);
//變數區==================================
//input:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["損益",2],["指標",3]),quickedit:=true);
//input:PIM(500000);//每檔交易資金
variable: TP(0),TQ(0),ID("");{交易價格/委託張數}
variable:RA(0),RB(0);//預設開關
variable:KN(0),KNN(0),DH(0),DL(0),TT(0);//KNN 進場後KN
variable:MKP(0),BCOST(0),BOUT(0),BT(0),N_PL(0),S_PL(0),A_PL(0),WT(0),WRate(0);
VALUE1 = bollingerband(Close, 20, 2);
VALUE2 = bollingerband(Close, 20, -2);
VALUE3=((VALUE1-VALUE2)/average(close, 20))*100;
CONDITION1=C>O[1] and V>Call_BV*1.5 and V>Call_BV*3
			and trueAll(VALUE3[1]<VALUE3[2],8) and VALUE3[1]<VALUE3[2] and VALUE3>VALUE3[2];
//邏輯區======================================
IF MKP=0 and CONDItion1 then begin //
	KNN=1;
	MKP=1;
	BCOST=C;
	BOUT=MAXList(C*0.92,VALUE2);
	RET=1;
	//TP = AddSpread(Close, +2); 
	//TQ = floor(PIM / (TP * 1000));
	//setposition(TQ,label:="進多");	
END;