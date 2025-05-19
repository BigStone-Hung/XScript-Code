{@type:indicator|@guid:3f71da893e86470bb4b42c8e1fdc65cc}
input:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["損益",2]),quickedit:=true);
//策略適用:現貨/空方/1分K
variable:RA(0),RB(0);//預設多重開關
variable:KN(0),KNN(0),DH(0),DL(0),TT(0),JVA(0),JVB(0);//KNN 進場後KN
variable:MKP(0),BCOST(0),BOUT(0),SCOST(0),SOUT(0),BT(0),ST(0),N_PL(0),S_PL(0),A_PL(0),WT(0),WRate(0);
//邏輯區======================================================================
IF DATE<>DATE[1] then 
	begin
		TT=0;
		KN=1;KNN=0;
		RA=0;RB=0;
		DH=H;DL=L;	
	End
ELSE
	Begin
		KN=KN+1;
		IF H>DH[1] then DH=H;
		IF L<DL[1] then DL=L;	
		IF H=L then begin //trueall(H=L,2)
			RA=RA+1;
		END;
		IF C>O and H>GetField("均價")*1.01 then begin
			RB=RB+1;
		END;
	End;
Value1=GetField("成交金額(元)");
Value2=average(GetField("成交金額(元)"),KN);		
//Value31=GetField("買進大單金額")-GetField("賣出大單金額")+GetField("買進特大單金額")-GetField("賣出特大單金額");
//=============================================================================================================================================================
CONDITION1= Time>=090400 and Time<=124500 and C>GetField("參考價", "D")*0.97 and C<GetField("均價")*0.99;
CONDITION2= C<O and RA=0 and RB=0 and V>Call_BV*1.5 and Call_BV>Call_BV[1] and C<((H-L)/3)+L; // and L=DL
CONDITION3= C>O and C[1]<O[1] and SOUT[1]>C*1.05;//KNN>55 and Value2>Value2[1];
CONDITION4= SCOST>SOUT and (SCOST-C)>(SCOST-SOUT)*2;
CONDITION5= O>C*1.013 and L=DL;
CONDITION6= C>O[1]*1.01 and C-O>C[1]-O[1];
CONDITION7= trueAll(V>Call_BV,3) and trueall(C<=O and L<L[1],2)[1];
CONDITION9= time=131700 or C>SOUT or L=GetField("跌停價", "D");
//=============================================================================================
Condition10=GetSymbolField("TSE.TW", "收盤價", "D")<GetSymbolField("TSE.TW", "開盤價", "D");
Condition11=GetSymbolField("TSE.TW", "收盤價", "D")<GetSymbolField("TSE.TW", "最高價", "D")[1];		
//部位控制區===================================================================================
IF MKP=-1 then begin
	If CONDITION9 then begin
		MKP=0;
		//setposition(0,label:="沖多_平");	
	End;

	IF CONDITION4 and (SCOST+C)/2<SOUT then begin
		SOUT=(SCOST+C)/2;
	End;
	IF CONDITION5 then begin
		//SOUT=SOUT-(C*0.013);
	End;
	IF CONDITION6 then begin
		//SOUT=SOUT-(C*0.013);
	End;
	IF CONDITION7 and VALUE1>VALUE2 and HIGHEST(H,5)<SOUT then begin
		SOUT=HIGHEST(H,5);
	End;
	KNN=KNN+1;
End;
//IF Condition10 and Condition11 then begin
	IF C<HIGHD(1) and O<GetField("均價") then begin //
		IF GetSymbolInfo("買賣現沖")=true then begin  //and summation(VALUE31,KN)<0 
			IF MKP=0 and TT=0 then begin  //and C<=H-((H-L)/3) 
				If (CONDITION1 and CONDITION2) then begin
					MKP=-1;
					SCOST=C;
					SOUT=C*1.02;
					KNN=1;
					TT=TT+1;
				END;
			END;
		END;
	End;
//End;
//回測段==========================================================================
IF MKP=1 then begin
	N_PL=(C-BCost)*1000;
End;
IF MKP=-1 then begin
	N_PL=(SCost-C)*1000;
End;
IF MKP<>1 and MKP[1]=1 then begin
	S_PL=((C-BCost)*1000)-(((BCOST+C)/2)*6);
	BT=BT+1;
	IF S_PL>0 then WT=WT+1;
	A_PL=A_PL+S_PL;
End;
IF MKP<>-1 and MKP[1]=-1 then begin
	S_PL=((SCost-C)*1000)-(((BCOST+C)/2)*6);
	ST=ST+1;
	IF S_PL>0 then WT=WT+1;
	A_PL=A_PL+S_PL;
End;
Wrate=IFF((BT+ST)>0,WT/(BT+ST),0);
//視覺設計==========================================================================
If plotmode=1 then begin	
	IF MKP[1]=0 and MKP=-1 then plot13(C,"放空點",checkbox:=1) Else noPlot(13);
	IF MKP[1]=-1 then begin
		plot14(SOut,"移動青線",checkbox:=1);
		plot15(SCost,"成本青線",checkbox:=1);
	End;
		//IF MKP<0 and C<GetField("參考價", "D")*0.98 then PLOT25(GetField("參考價", "D")*0.98) else noplot(25);
		//IF MKP<0 and C<GetField("參考價", "D")*0.96 then PLOT26(GetField("參考價", "D")*0.96) else noplot(26);
		//IF MKP<0 and C<GetField("參考價", "D")*0.94 then PLOT27(GetField("參考價", "D")*0.94) else noplot(27);
		//IF MKP<0 and C<GetField("參考價", "D")*0.92 then PLOT28(GetField("參考價", "D")*0.92) else noplot(28);
End;
If plotmode=2 then begin
 Plot30(0,"零軸");
 IF MKP[1]=-1 then Plot31(N_PL,"單次損益",checkbox:=1);
 Plot32(A_PL,"累計損益",checkbox:=1);
 Plot36(BT,"多方次數");
 Plot37(Wrate,"勝率");
End;
