{@type:indicator|@guid:ff9f0a641fe74994b02bb323fe319b10}
input:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["損益",2],["指標",3]),quickedit:=true);
variable:PP(1.5),MKP(0),BCost(0),BOut(0),SCost(0),SOut(0),N_PL(0),S_PL(0),A_PL(0);
//定義數值==========================================
Value8=average(C,8);
Value21=average(C,21);
Value55=average(C,55);
VALUE101=((Value8-Value21)/Value21)*100;//(8/21距離)
VALUE102=((Value21-Value55)/Value55)*100;//(21/55距離)
VALUE103=((Value8-Value55)/Value55)*100;//(8/55距離)
value201=maxlist(value8,value21,value55);
value202=minlist(value8,value21,value55);
value203=maxlist(highest(value8,34),highest(value21,34),highest(value55,34));
value204=minlist(lowest(value8,34),lowest(value21,34),lowest(value55,34));
//定義狀態====================================
condition100= VALUE101<=PP and VALUE101>=-PP and VALUE102<=PP and VALUE102>=-PP	and VALUE103<=PP and VALUE103>=-PP;
condition101= maxlist(VALUE101,VALUE102,VALUE103)-minlist(VALUE101,VALUE102,VALUE103)<=PP*2 and Call_W55>0;
condition200= VALUE101>VALUE101[1] and VALUE102>VALUE102[1] and VALUE103>VALUE103[1] and value103=maxlist(VALUE101,VALUE102,VALUE103);
//====================================================================================
IF MKP=0 and CONDITION101 and C>O and V>100 and GetField("股本(億)","D")<100 and GetField("股本(億)","D")>3 then begin
	If CONDITION101[1] and C>O and V>average(V,21) and H<highest(H,8) and highest(H,3)<highest(H,55)
			and IFF(value202=0,0,(value201-value202)/value202) <0.13 
			and IFF(value202=0,0,(value203-value202)/value202) <0.21 
			and not(value101<=value101[1] and value101<=value101[1] and value103<=value103[1])
			and not(value101<=value101[1] and value101=minlist(VALUE101,VALUE102,VALUE103))
			and not(H<=H[1] and L<=L[1]) then begin
				MKP=1;
				BCOST=C;
				BOUT=C*0.92;
	END;
END;
IF MKP=1 THEN BEGIN
	IF C<BOUT or (CONDITION3 and highest(H,3)/LOwest(L,3)>1.21) THEN BEGIN
		MKP=0;
	END;
	IF H=HIghest(H,21) and LOWest(L,8)>BOUT then begin
		BOUT=LOWest(L,8);
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
END;
//回測計算==============================================
IF MKP=1 then begin
	N_PL=(C-BCost)*1000;
End;
IF MKP<>1 and MKP[1]=1 then begin
	S_PL=((C-BCost)*1000)-(((BCOST+C)/2)*6);
End;
IF MKP<>1 and MKP[1]=1 then begin
	A_PL=A_PL+S_PL;
End;
//視覺設計==============================================
If plotmode=1 then begin
	IF MKP[1]=1 then begin
	  IF MKP[2]=0 then plot11(BCost,"多方成本",checkbox:=1) else noPlot(11);
	  plot12(BCost,"多方成本",checkbox:=1);
	  plot13(BOut,"多方移動",checkbox:=1);
	End;
End;
If plotmode=2 then begin
	 Plot30(0,"零軸",checkbox:=1);
	 IF MKP<>0 then Plot31(N_PL,"浮動損益",checkbox:=1);
	 IF (MKP[1]<>0 and MKP=0)  then Plot32(S_PL,"出場損益",checkbox:=1);
	 Plot33(A_PL,"累計損益",checkbox:=0);
End;