{@type:filter|@guid:f167c953693e4b6a872690d9f1ee83f8}
setbarfreq("AD");
settotalbar(56);
//宣告變數=>盡量少用INPUT
variable:PP(1.5),KN(0),FT(0),FEE(4),MKP(0),BCost(0),BOut(0),SCost(0),SOut(0),N_PL(0),S_PL(0),A_PL(0);
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
condition101= maxlist(VALUE101,VALUE102,VALUE103)-minlist(VALUE101,VALUE102,VALUE103)<=PP*2 and Call_55W>0;
condition200= VALUE101>VALUE101[1] and VALUE102>VALUE102[1] and VALUE103>VALUE103[1] and value103=maxlist(VALUE101,VALUE102,VALUE103);

//IF CONDITION101 and C>O and V>100 and GetField("股本(億)","D")<100 and GetField("股本(億)","D")>3 then begin
	If CONDITION101[1] and C>O and V>average(V,21) and H<highest(H,8) and highest(H,3)<highest(H,55)
			and IFF(value202=0,0,(value201-value202)/value202) <0.13 
			and IFF(value202=0,0,(value203-value202)/value202) <0.21 
			and not(value101<=value101[1] and value101<=value101[1] and value103<=value103[1])
			and not(value101<=value101[1] and value101=minlist(VALUE101,VALUE102,VALUE103))
			and not(H<=H[1] and L<=L[1])
	then RET=1;
//End;

