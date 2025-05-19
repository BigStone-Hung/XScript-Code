{@type:indicator|@guid:a9d4856a90664de2a2825543e7475154}
//衍生性買賣關係 和  台積量能對應指數之觀察
settbmode(1);
input:plotmode(1,"主副圖:", inputkind:=Dict (["衍生金融",1],["台積佔比",2]),quickedit:=true);
value1=(O+H+L+C)/4;
VALUE2=AVERAGE((HIGHEST(H,89)+LOWest(L,89))/2,13);
value11=GetSymbolField("FITXN*1.TF", "十大交易人未沖銷買口", "D")*1;
value12=GetSymbolField("FITXN*1.TF", "十大交易人未沖銷賣口", "D")*-1;
VALUE51=GetSymbolField("TSE.TW", "成交金額(元)");
VALUE52=GetSymbolField("2330.TW", "成交金額(元)");
VALUE53=ROUND((VALUE52/VALUE51)*100,0);
IF plotmode=2 then begin
	plot51(value11,"衍買未沖",checkbox:=1);
	plot52(value12,"衍賣未沖",checkbox:=1);
	plot53((value11+value12)*3,"三倍未沖",checkbox:=1);
	IF (H>H[1] and L>L[1]) and trueAll((value11[1]+value12[1])<0,5) and (value11+value12)>0 then plot54(value11,"訊號黃線") else plot54(0,"訊號黃線");
End;
IF plotmode=3 then begin
	IF SYMBOL="TSE.TW" or SYMBOL="OTC.TW" THEN BEGIN
		PLOT61(VALUE51,"大盤成交");
		PLOT62(VALUE52*2,"台積成交");
		PLOT63(VALUE53,"台積佔比");
		PLOT64(21,"上緣參考");
		PLOT65(13,"上線參考");
		PLOT66(5,"下緣參考");
	End;
End;



