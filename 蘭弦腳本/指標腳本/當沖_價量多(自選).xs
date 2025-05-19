{@type:indicator|@guid:bfb00a2474674e378e4c362f56df5f47}
input:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["損益",2]),quickedit:=true);
//策略適用:現貨/空方/1分K
variable:RA(0),RB(0);//預設多重開關
variable:KN(0),KNN(0),DH(0),DL(0),TT(0),JVA(0),JVB(0);//KNN 進場後KN
variable:MKP(0),BCOST(0),BOUT(0),BT(0),N_PL(0),S_PL(0),A_PL(0),WT(0),WRate(0);
//視覺設計==========================================================================
CONDITION2=V>Call_BV*2 and V[1]>Call_BV[1]*2;
If plotmode=1 then begin
	IF Time=090000 and DATE<CURRENTDATE then plot1(25000,"跨日黃框") Else noPlot(1);	
	IF Time=090000 then plot1(25000,"跨日黃框") Else noPlot(1);	
	IF DAte=DAte[1] then begin
		PLOT2(GetField("均價"),"基本均價",checkbox:=1);
		PLOT3(GetField("均價")*1.01,"均價上軌",checkbox:=1);
		PLOT4(GetField("均價")*0.99,"均價下軌",checkbox:=1);
	End;
	IF DATE>=CURRentDate-5 then begin
	
		IF TIME<091500 THEN PLOT20(GetField("參考價", "D"));
		
		PLOT21(GetField("參考價", "D")*1.01);
		PLOT22(GetField("參考價", "D")*1.02);
		PLOT23(GetField("參考價", "D")*1.03);
		PLOT24(GetField("參考價", "D")*1.04);
		PLOT25(GetField("參考價", "D")*1.05);
		PLOT26(GetField("參考價", "D")*1.06);
		PLOT27(GetField("參考價", "D")*1.07);
		PLOT28(GetField("參考價", "D")*1.08);
		PLOT29(GetField("參考價", "D")*1.09);
		PLOT30(GetField("參考價", "D")*1.10);

		PLOT31(GetField("參考價", "D")*0.99);
		PLOT32(GetField("參考價", "D")*0.98);
		PLOT33(GetField("參考價", "D")*0.97);
		PLOT34(GetField("參考價", "D")*0.96);
		PLOT35(GetField("參考價", "D")*0.95);
		PLOT36(GetField("參考價", "D")*0.94);
		PLOT37(GetField("參考價", "D")*0.93);
		PLOT38(GetField("參考價", "D")*0.92);
		PLOT39(GetField("參考價", "D")*0.91);
		PLOT40(GetField("參考價", "D")*0.90);	

	END;
	IF trueAll(V>Call_BV,3) and trueall(C<=O,2)[1] then PLOT99(H*1.005,"觀察重點");
	//IF TIME>090100 and TIME<131000 and CONDITION2 and (trueAll(C>O,2) or trueAll(C<O,2)) then PLOT98(H,"A");
	//IF TIME>090100 and TIME<131000 and CONDITION2 and (trueAll(C>O,2) or trueAll(C<O,2)) then PLOT99(H,"B");	
End;
If plotmode=2 then begin
 //Plot30(0,"零軸");
 //IF MKP[1]=1 then Plot31(N_PL,"單次損益",checkbox:=1);
 //Plot32(A_PL,"累計損益",checkbox:=1);
 //Plot36(BT,"多方次數");
 //Plot37(Wrate,"勝率");
End;
