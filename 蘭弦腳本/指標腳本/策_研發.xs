{@type:indicator|@guid:eeabc1cf74aa438590ae331a8c02d768}
input:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["損益",2],["指標",3]),quickedit:=true);
variable:FEE(0),MKP(0),BT(0),WT(0),BCost(0),BOut(0),N_PL(0),S_PL(0),A_PL(0),HPF(0),MDD(0),MaxMDD(0),Wrate(0);
/////////===========================
CONDITION1=Call_55W[1]<0 and Call_55W[0]>0;
CONDITION9=AVERAGE(C,10)>BCOST and AVERAGE(C,10)>AVERAGE(C[1],10) and AVERAGE(C,10)>BOUT;
IF MKP=0 and CONDITION1 THEN BEGIN
	PLOT1(C,"55W");
	MKP=1;
	BCOST=C;
	BOUT=BCOST*0.92;
END;

IF MKP=1 THEN BEGIN
	IF C<BOUT then MKP=0;
	IF CONDITION9 then BOUT=AVERAGE(C,10);
END;
//回測計算=====================================================================================================
IF MKP=1 then begin
	N_PL=(C-BCost)*1000;
End;
IF MKP<>1 and MKP[1]=1 then begin
	S_PL=((C-BCost)*1000)-(((BCOST+C)/2)*6);
	IF S_PL>0 then WT=WT+1;
End;
IF MKP<>1 and MKP[1]=1 then begin
	A_PL=A_PL+S_PL;
	BT=BT+1;
End;
IF  ISLastBar and MKP<>0 then begin
	A_PL=A_PL+N_PL;
End;
If A_PL>HPF then begin
	HPF=A_PL;
End;
MDD=A_PL-HPF;
If MDD<MaxMDD then MaxMDD=MDD;
IF BT>0 then Wrate=(WT/BT)*100 else Wrate=0;
//視覺設計==============================================
If plotmode=1 then begin
	IF MKP=1 then begin
	  If MKP[1]<>1 then plot11(C,"出手黃點",checkbox:=1) Else noPlot(11);
	  plot12(BCost,"成本白段",checkbox:=1);
	  plot13(BOut,"移動綠段",checkbox:=1);
	End;
End;
If plotmode=2 then begin
	 PLOT30(0,"零軸");
	 IF MKP<>0 then Plot31(N_PL,"浮動損益",checkbox:=1);
	 IF (MKP[1]<>0 and MKP=0)  then Plot32(S_PL,"出場損益",checkbox:=1);
	 Plot33(A_PL,"累計損益",checkbox:=1);
	 //Plot34(BT,"多方次數",checkbox:=0);
	 //Plot35(ST,"空方次數",checkbox:=0);
	 Plot37(-MaxMDD,"最大虧損",checkbox:=0);
	 Plot38(IFF(MaxMDD<>0,A_PL/-MaxMDD,0),"報籌/風險",checkbox:=0);
	 Plot39(Wrate,"勝率",checkbox:=0);
End;