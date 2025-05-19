{@type:indicator|@guid:6557749051784c8f88489f003ca0b770}
input:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["副圖",2]),quickedit:=true);
value1=GetField("融券餘額張數")+GetField("借券餘額張數");
value2=IFF(SUMmation(GetField("現券償還張數"),89)>0,SUMmation(GetField("現券償還張數"),89),0);
If plotmode=1 then begin
	IF Call_CBD>0 and Call_CBP>0 and Call_CBR<100 then begin 	
		CONDITION55= GetField("當日沖銷張數")>Call_BV;
		If Date>Call_CBD then plot1(Call_CBD,"轉換日") else noplot(1);
		IF Date>Call_CBD then plot2(Call_CBP,"轉換價") else noplot(2);
		IF Date>Call_CBD then Plot3(ROUND(Call_CBR,0)/100,"轉換比") else noplot(3);
		If Date>Call_CBD then begin
			If COUNTIf(CONDITION55[1],13)>=2 and countif(L>L[1],5)>=3 and C>Call_CBP*1.13 and H[1]=highest(H,5) and L[1]>L[2] and C<O then PLOT4(H,"熱沖黃點",checkbox:=1);
		END;
	End;
End;
If plotmode=2 then begin
	If value1>0 and value2>0 then begin
		plot11(value1,"總券餘",checkbox:=1);
		plot12(GetField("借券餘額張數"),"借券餘",checkbox:=1);
		plot22(value2,"現償",checkbox:=1);
		plot33(value1,"待補",checkbox:=1);
		plot44(GetField("借券餘額張數"),"借餘");
	End;
	Plot51(ROUND(Call_CBR,0)/100,"轉換比率");
End;


