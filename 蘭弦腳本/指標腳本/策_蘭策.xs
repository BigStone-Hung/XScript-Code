{@type:indicator|@guid:ce509fca7d20458d87b6dfca2f9ea706}
input:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["損益",2],["指標",3]),quickedit:=true);
VAR:BD(0),BP(0),MKP(0),BCOST(0),BOUT(0),BT(0),N_PL(0),S_PL(0),A_PL(0),WT(0),WRate(0);
VAR:BAO(0),AAO(0);
//IF FIlled>0 THEN BEGIN
	IF SYmbol="1806.TW" THEN BD=20250407;
	IF SYmbol="6206.TW" THEN BD=20250106;
	IF DATE=BD THEN BEGIN
		BCOST=C;
		BP=LOWEST(L,3);
		BOUT=LOWEST(L,3);
		MKP=1;
	END;
	IF Call_AO>0 and Call_AO[1]=HIGHEST(Call_AO,34) then begin
		BAO=AAO;
		IF LOWEST(C,3)*0.98>BAO THEN AAO=LOWEST(C,3)*0.98;
	End;
	IF H<AAO THEN begin
		AAO=0;
		BAO=0;
	End;	

	//部位控制區==============
	IF MKP=1 THEN BEGIN
		IF C<BOUT THEN BEGIN
			MKP=0;
			//setposition(0,label:="平多");
		END;
		IF C>BCOST THEN BEGIN
			IF H/BCOST>=1.13 and H/BCOST<1.21 and Call_MP[1]>BOUT then begin
				BOUT=Call_MP[1];
			END;
			IF H/BCOST>=1.21 and H/BCOST<1.34 and AAO>BOUT then begin
				BOUT=AAO;
			END;
			IF H/BCOST>=1.34 and H/BCOST<1.55 and Call_MB[1]>BOUT then begin
				BOUT=Call_MB[1];
			END;
			IF H/BCOST>=1.55 and H/BCOST<=1.89 and L>H[1]*1.01 and LOWEST(L[1],3)>BOUT then begin
				BOUT=LOWEST(L[1],3);
			END;
			IF H/BCOST>=1.89 and MAXList(Call_MP[1],AAO,Call_MB[1])>BOUT then begin
				BOUT=MAXList(Call_MP[1],AAO,Call_MB[1]);
			END;
		END;
	End;
	IF MKP=0 THEN BEGIN

	End;
	//回測區==========================================================================
	IF MKP=1 then begin
		N_PL=(C-BCost)*1000;
	End;
	IF MKP<>1 and MKP[1]=1 then begin
		S_PL=((C-BCost)*1000)-(((BCOST+C)/2)*6);
		BT=BT+1;
		IF S_PL>0 then WT=WT+1;
		A_PL=A_PL+S_PL;
	End;
	Wrate=IFF (BT>0,WT/BT,0)*100;
	//視覺區==========================================================================
	If plotmode=1 then begin
		If MKP[1]=0 and MKP=1 then plot11(BCost,"進場黃點",checkbox:=1);
		IF MKP[1]=1 then begin
		  plot12(BCost,"成本白線",checkbox:=0);
		  plotFill(13,0,BOut,"移動紫線",checkbox:=1);
		End;
	End;
	If plotmode=2 then begin
		Plot20(0,"基準零軸");
		Plot21(BT,"交易次數"); 
		Plot22(Wrate,"交易勝率"); 
		Plot23(A_PL,"累計損益",checkbox:=0);	
		IF MKP<>0 then Plot24(N_PL,"浮動損益",checkbox:=1);
		IF MKP[1]=1 and MKP[0]=0 then Plot25(S_PL,"單次損益",checkbox:=1);
	End;
//END;

