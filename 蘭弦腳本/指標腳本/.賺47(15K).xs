{@type:indicator|@guid:1172b8a053614d9e9f0358d10a164773}
//setfirstBarDate(20240101);
input:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["損益",2]),quickedit:=true);
variable:FT(0),FEE(4),MKP(0),BT(0),ST(0),WT(0),BCost(0),BOut(0),SCost(0),SOut(0),N_PL(0),S_PL(0),A_PL(0),Htimes(0),HPF(0),MDD(0),MaxMDD(0),ROA(0),Hrate(0),Wrate(0);
VALUE1=highest(H,4);
VALUE2=LOWest(L,4);
VALUE3=absValue(VALUE1-VALUE2);
//=========================================================================
COndition1=C[1]<Call_3Center[1] and C>Call_3Center and C>=H[1];//and Call_3D_Center[1]<=Call_3D_Center[2] 
COndition2=C[1]>Call_3Center[1] and C<Call_3Center and C<=L[1];//and Call_3D_Center<=Call_3D_Center[1] 
//COndition3=bollingerBand(C,21,2)>bollingerBand(C,21,2)[1] or bollingerBand(C,21,-2)>bollingerBand(C,21,-2)[1];
COndition4=O-C>absValue(O[1]-C[1]) and C<average(C,21);
condition33= time=044500 or time=133000;
condition77=absValue(C-O)>(absValue(H[1]-L[1])/3)*2;
condition99=VALUE3>(C*0.0089) and C>O;
//===============================邏輯區=====================================
IF barfreq="Min" then begin 
 If barinterval = 5 then FT=132500;
 If barinterval = 10 then FT=131500;
 If barinterval = 15 then FT=130000;
 If barinterval = 20 then FT=130500;
 If barinterval = 30 then FT=124500;
 If barinterval = 45 then FT=123000;
 If barinterval = 60 then FT=114500;
End;
If DayOfWeek(Date) = 3 and DayOfMonth(Date)>14 and DayOfMonth(Date)<22 and Time=FT  then
	begin
		MKP=0;
		IF plotmode=1 then PLOT99(30000,"結算");
	End;
//==============================
If not(condition33) then begin
	IF MKP=1 then begin	
		IF C<BOUT and C<minList(L[1],L[2]) then begin
			MKP=0;//右圖當收棒當下未出場原因 C<minList(L[1],L[2])
		End;
		IF condition99 and O[2]>BOUT then begin
			BOUT=O[2];
		End;
		IF Call_3Center>BOUT and Call_3Center<>Call_3Center[1] then begin
			BOUT=Call_3Center;
		End;
		IF trueAny(C[1]>O[1],2) and C<O then begin
			If C-BOUT>=250 then begin
				BOUT=BOUT+50;
			End;
			If N_PL>=500 and C<L[1] and C-BOUT+100>200 then begin
				BOUT=BOUT+100;
			End;
		End;
	End;
	IF MKP=-1 then begin	
		IF C>SOUT and C>maxList(H[1],H[2]) then begin
			MKP=0;
		End;
		IF Call_3Center<SOUT and Call_3Center<>Call_3Center[1] and L>L[1] then begin
			SOUT=Call_3Center;
		End;
		IF Condition33[1] and H<lowest(L[1],8) then begin
			SOUT=H[1];
		End;	
		IF SCOST>C+(C*0.021) and (C*0.021)+C<SOUT then begin
			SOUT=(C*0.021)+C;
		End;
	End;
	If MKP<=0 and CONDITION1 and trueAny(C[1]>O[1],2) then begin
		MKP=1;
		BCOST=C;
		BOUT=MInList2(lowD(0),lowD(1),lowD(2));
	END;
	If MKP>=0 and CONDITION2 and CONDITION4 and trueAny(C[1]<O[1],2) then begin//and not(Time=084500 and (C[1]-C)/C[1]<C*0.0144) and time=084500
		MKP=-1;
		SCOST=C;
		SOUT=MaxList2(HighD(0),HighD(1),HighD(2));
	END;
END;
//回測計算==============================================
IF MKP=1 then begin
	N_PL=C-BCost-FEE;
End;
IF MKP=-1 then begin
	N_PL=SCost-C-FEE;
End;
IF MKP<>1 and MKP[1]=1 then begin
	BT=BT+1;
	IF MKP=0 then S_PL=C-BCost-FEE;	
	IF MKP=-1 then S_PL=(C-BCost)-(2*FEE);	
	A_PL=A_PL+S_PL;	
	IF S_PL>0 then WT=WT+1;
End;
IF MKP<>-1 and MKP[1]=-1 then begin
	ST=ST+1;
	IF MKP=0 then S_PL=SCost-C-FEE;	
	IF MKP=1 then S_PL=(SCost-C)-(2*FEE);	
	A_PL=A_PL+S_PL;
	IF S_PL>0 then WT=WT+1;
End;
If A_PL>HPF then begin
	HPF=A_PL;
	Htimes=Htimes+1;
End;
MDD=A_PL-HPF;
If MDD<MaxMDD then MaxMDD=MDD;
IF MaxMDD<>0 then ROA=A_PL/-MaxMDD else ROA=0;
IF (BT+ST)>0 and Htimes<>0 then Hrate=(A_PL/Htimes) else Hrate=0;
IF (BT+ST)>0 then Wrate=(WT/(BT+ST))*100 else Wrate=0;
//視覺設計==============================================
If plotmode=1 then begin
	If MKP=0 then plot1(Call_3Center,"高低均線",checkbox:=0) Else noPlot(1);
	//plot1(Call_3Center,"高低均線",checkbox:=1);
	IF MKP=1 and MKP[1]<>1 then plot2(C,"出手多",checkbox:=1) Else noPlot(2);
	IF MKP=-1 and MKP[1]<>-1 then plot3(C,"出手空",checkbox:=1) Else noPlot(3);
	IF MKP[1]=1 then begin
	  plot13(BCost,"多方成本",checkbox:=1);
	  plot14(BOut,"多方移動",checkbox:=1);
	End;
	IF MKP[1]=-1 then begin
	  plot23(SCost,"空方成本",checkbox:=1);
	  plot24(SOut,"空方移動",checkbox:=1);
	End;	
End;
If plotmode=2 then begin
	 Plot29(MKP,"目前部位",checkbox:=0);
	 IF MKP<>0 then Plot30(N_PL,"浮動損益",checkbox:=1);	 
	 IF MKP=1 and N_PL>0 and C>BOUT then Plot31(IFF(BOUT-BCOST<0,0,BOUT-BCOST),"可能利潤",checkbox:=1);
	 IF MKP=-1 and N_PL>0 and C<SOUT then Plot31(IFF(SCOST-SOUT<0 or N_PL<SCOST-SOUT,0,SCOST-SOUT),"可能利潤",checkbox:=1);	 
	 IF (MKP[1]<>0 and MKP<>MKP[1]) then Plot32(S_PL,"出場損益",checkbox:=1);
	 Plot33(A_PL,"累計損益",checkbox:=0);
	 Plot34(BT,"多方次數",checkbox:=0);
	 Plot35(ST,"空方次數",checkbox:=0);
	 Plot36(ROUND(Wrate/100,2),"勝率",checkbox:=0);
	 Plot37(round(ROA,1),"報風比",checkbox:=0);
	 Plot38(ROUND(Hrate,0),"增高力",checkbox:=0);
	 Plot39(MaxMDD,"MDD",checkbox:=0);
	 //Plot40(MKP,"目前部位",checkbox:=0);
	 Plot41(0,"000",checkbox:=1);
	 Plot42(250,"250",checkbox:=0);
	 Plot43(500,"500",checkbox:=0);	 	 
End;


