{@type:indicator|@guid:405d76346c754649a61d38a7b0a8167f}
//蘭弦波段操作經驗訊號之總和  關注在買點與停利點之用 
settbmode(0);
variable:I(0),J(0),J_Empty(0),JUCount(0),JDCount(0);
//===============================================================================================================================================
value1=lowest(GetSymbolField("TSE.TW","最低價","D"),144);
For J=0 to 144
	begin
		If GetSymbolField("TSE.TW","最低價","D")[J]=Value1 then
			begin
				value2=J;
				value3=date[J];
				value4=L[J];
				break;
			End;
	End;
value5=(C-Value4)*100/Value4;
Value6=Round(((highest(H,55)-C)/highest(H,55))*100,0);
//===================================================================================================================================
VALUE11=highest(H[1],144);
VALUE14=VALUE11*0.79;
//VALUE16~19 跳空區用途
//========================================================================
VALUE15=GetField("投信持股比例", "D")+GetField("外資持股比例", "D");
//================================================================================================================================
if gettotalbar-currentbar=54 then value21=C;
//============================================================================================================
VALUE31=maxList(AVERAGE(C,8),AVERAGE(C,21),AVERAGE(C,55));
VALUE32=minList(AVERAGE(C,8),AVERAGE(C,21),AVERAGE(C,55));
VALUE33=(VALUE31-VALUE32)/VALUE32;
//====================================================================================================================================
VALUE61=highest(H,13)-lowest(L,13);
VALUE62=highest(H,21)-lowest(L,21);
VALUE63=highest(H,34)-lowest(L,34);
VALUE64=Iff(C<O,V,0);
VALUE65=highest(value64[1],0);
//===================================================================================================================================
CONDITION1= C<O and Highest(V,3)=Highest(V,55) and Highest(H,3)=Highest(H,55) and (H<H[1] or C<O[1]);
CONDITION2= GetField("當日沖銷張數")>Call_BV;
CONDITION3=H[2]=highest(H,13) and (C<O[2] or C<L[1]) and (V[1]=highest(V,13) or V[2]=highest(V,13) or V[3]=highest(V,13));
CONDITION4=C-O>H-C;
CONDITION5=(MAXLIST(O,C)-MINLIST(O,C))>H-MAXLIST(O,C)+MINLIST(O,C)-L;
//=================================================================================================================================
CONDITION11=L>H[1] and (C>=(H+L)/2 or C>=O) and H>=H[1];
CONDITION12=H<L[1] and (C<=(H+L)/2 or C<=O) and L<=L[1];
//===========================================================================================================================
CONDITION31=C>GetField("參考價","D")*1.021;
CONDITION32= C=highest(C,13) and V>Call_BV and V>V[1]*1.33 and VALUE31>VALUE31[1] and VALUE33>VALUE33[1];
CONDITION33=(C<AVERAGE(C,55) and AVERAGE(C,55)<AVERAGE(C,55)[1]);
CONDITION35=VALUE33<0.055 and C>(VALUE31+VALUE32)/2 and Call_MP>AVERAGE(C,55);
//==============================================================================================================================
CONDITION52= trueall(L>average(C,55),2);
CONDITION53= average(C,5)[1]<average(C,5)[2];
//=============================================================================================================================================
CONDITION61= H=GetField("漲停價", "D");
CONDITION62= trueAny(L=GetField("跌停價", "D") or C<GetField("參考價", "D")*0.98,5) and C<L[1] and C<O;
CONDITION63= CONDITION62 and trueAny(CONDITION61[1],8) and not(trueany(CONDITION62[1],5)) and (V>V[1] or Call_BV>Call_BV[1] or C=L);
CONDITION67=VALUE15<VALUE15[1] and VALUE15[1]<VALUE15[2] and C<O and highest(H,2)=highest(H,5);
CONDITION68=TRueAll(V>CAll_BV,2) and Call_BV>Call_BV[1];
//=====================================================================================================================================================
CONDITION70= C>O and C>L[1] and L[1]<L[2] and L[2]<L[5] and lowest(L,3)=lowest(L,21) and highest(V,2)=highest(V,13) and V>V[1]/2 and Call_BV>Call_BV[1];
CONDITION71= C<O and L=LOWEST(L,8) and Highest(H,2)<Highest(H,5) and GetField("控盤者買賣超張數")>0 and C>=(H+L)/2 ;
CONDITION72= lowest(L,2)>lowest(L,5) and value5>5 and value6<=5 and Call_BV>Call_BV[1] and C>O and Call_55B>0;
//==============================================================================================================================================
CONDITION81= C>GetField("參考價","D")*1.05;
CONDITION82= C>O and C=highest(C,13) and V>average(V,13)*3 and V>V[1]*2;
CONDITION83=not(trueany(condition81[1],21)) and countif(condition82[1],8)<=1; 
//===========================================================================================================================================
CONDITION91=C[2]>O[2] and (C-lowest(L,21))/lowest(L,21)>0.13;
CONDITION92=Highest(H,2)=Highest(H,8) and Highest(V,2)=Highest(V,8) and C<O and L<(H[1]+L[1])/2 ;
CONDITION93=V>MINList(AVerage(V,8),AVerage(V,13),AVerage(V,21))*2;
//==================================================
If CONDITION1 and not(CONDITION1[1]) then begin
	VALUE15=Highest(H,3);//蟄伏點
End;
//===================================================================================================================================
IF barFreq<>"Min" and symbol<>"TSE>TW" then begin
	PLOT1(ROUND(GetField("本益比", "D"),0),"本益比",checkbox:=0);
	PLOT2(GetField("殖利率", "D")/100,"殖利率",checkbox:=0);
	//斷層/主控/季線/蟄伏點======================================================================================================================
	If C>value14 and Value14=highest(value14,144) then plot3(value14,"斷層綠線",checkbox:=1);	//Else Noplot(1); 
	IF Call_MP>=average(C,55) then	
		begin
			plot4(Call_MP,"主控黃線",checkbox:=1);
		end
		else
		begin
			plot5(average(C,55),"季均白線",checkbox:=1);			
		End;
	If gettotalbar-currentbar<=54 then plot6(value21,"扣抵白線",checkbox:=0);
	IF H<VALUE15 then PLOT7(VALUE15,"蟄伏參考",checkbox:=0);
	//PLOT8(Call_MB,"資均點線",checkbox:=0);
	//===================================================================================================================================
	IF Condition11 then begin
		JDCount=0;
		JUCount=JUCount+1;
		IF JUCount=1 then begin
			VALUE16=maxlist(O[1],C[1]);
			VALUE17=L;
		End;
	End;
	If condition12 then begin
		JUCount=0;
		JDCount=JDCount+1;
		IF JDCount=1 then begin
			VALUE18=minlist(O[1],C[1]);
			VALUE19=O;
		End;
	End;
	If JUCount>0 and TRUEAll(C<VALUE16,3) then JUCount=0;
	If JDCount>0 and TRUEAll(C>VALUE18,3) then JDCount=0;
	If JUCount=1 and JUCount[1]<>1 then plot9(VALUE16,"起漲缺口",checkbox:=1);
	If JDCount=1 and JDCount[1]<>1 then plot10(VALUE18,"起跌缺口",checkbox:=1);
	IF JUCount>0 then PlotFill(11, VALUE16, VALUE17,"起漲區域") Else noPlot(11);
	//IF JDCount>0 then PlotFill(12, VALUE18, VALUE19,"起跌區域",checkbox:=1) Else noPlot(12);
	//起承轉合========================================================
	IF barFreq<>"W" and barFreq<>"AW" then begin
		//起=======================================================================================================================
		If C>(H+L)/2 and (V>Call_BV or Call_BV>Call_BV[1]) then begin
			if C>O and H>H[1] and C>C[1] and trueall(percentr(55)-50>0,3) and average(C,55)<average(C,55)[1] then plot14(L,"起點",checkbox:=1);	//1
		End;			
		//壓縮後同步=================================================================================================================
		IF C>(H+L)/2 and L<H[1] and L>L[1] and V[1]<Call_BV*2 and V<Call_BV*2.5 and value33<0.1 and trueAny(L[1]<=VALUE31[1],2) and condition32 and countif(condition31[13],34)<=3 then begin
			If CONDITION4 and not(CONDITION33) then plot15(VALUE31,"同步",checkbox:=1);
		End;
		//拉回買點====================================================================================================================	
		IF C>O and L[1]<L[2] and C>Call_MP[1] and condition53 and trueany(condition52,13) and V>V[1] and (C[1]<=O[1] or C[2]<=O[2])  
			and C>=(H+L)/2 and C>(H[1]+L[1])/2  and Call_55W>0 and C<highest(H[1],5) and lowest(L,5)>Lowest(L,13) 
			and L>lowest(L,5) and not(V<Call_BV and Call_BV<Call_BV[1]) then plot16(L,"拉回",checkbox:=1);
		//合==========================================================================================================================
		IF countif(condition81[8],21)<=3 and H[1]<highest(H[1],8) then begin 
			IF condition82 and condition83 and not(trueAny(condition82[1],5)) and C>(H+L)/2 then plot19(L*0.98,"收斂",checkbox:=1);
		End;
	    //殺出恐慌====================================================================================================================
		IF condition70 then plot20(L,"恐嚇",checkbox:=1);
		IF condition71 and not(condition70[1]) then plot21(L,"恐慌",checkbox:=1);
		IF CONDITION72 and not(trueAny(CONDITION72[1],8)) 
			and CONDITION5 and H>O[2] and Call_MP>Call_MP[1] and L>Call_MP and V<Call_BV*2 
			then plot22(L,"相對",checkbox:=1);		
		//停利============================================================================================================================
		IF C[1]>O[1] and H[1]>H[2] and V[1]>CALL_BV[1] and CONDITION63 then PLOT23((H+L)/2,"落跑");
		IF C>O[1] and trueAll(V>Call_BV*2,2) and ((value31[1]>Call_MP[1] or V[2]>Call_BV[2]*2) and C<(H+L)/2) then PLOT24(H,"滿足",checkbox:=1);
		If (L[2]>H[3] or L[1]>H[2] or L>H[1]) and highest(H[1],5)=highest(H[1],55) and C<O and C<H[1] and C<(H+L)/2 and Bias(55)[1]>17 then Plot25(H,"爆停",checkbox:=1);
		If condition91 and condition92 and condition93 and C<(H+L)/2 then PLOT26(H[1]*1.02,"止漲",checkbox:=1);
		IF CONDITION67 and CONDITION68 then plot27(L,"脫手",checkbox:=1);
		//PLOT28 PLOT29 PLOT30
		//============================================================================================================================================
		IF trueAny(condition35,3) and Call_55W>0 and C>Call_MP and Call_MP>Call_MP[1] and AVERAGE(H,5)>AVERAGE(H,5)[1] and C>L[1] then begin
			//plot31(VALUE31,"UP線段",checkbox:=1);
			//plot32(VALUE32,"DN線段",checkbox:=1);
			//plot33(VALUE31,"UP橘框",checkbox:=1);
			//plot34(VALUE32,"DN黑柱",checkbox:=1);
			//plot35(Call_MP*0.995,"DN橘點",checkbox:=1);
			If not(trueAny(trueAll(H>H[1] and L>L[1],3),3)) then plot36(Call_MP,"壓縮",checkbox:=1);
		End;
	End;
End;
//公司債資訊
IF Call_CBD>0 and Call_CBP>0 and Call_CBR<100 then begin 	
	If Date>Call_CBD then plot51(Call_CBD,"發行日") else noplot(51);
	IF Date>Call_CBD then plot52(Call_CBP,"轉換價") else noplot(52);
	IF Date>Call_CBD then Plot53(ROUND(Call_CBR,0)/100,"轉換比") else noplot(53);
	If Date>Call_CBD then begin
		If COUNTIf(CONDITION2[1],13)>=2 and countif(L>L[1],5)>=3 and C>Call_CBP*1.13 and H[1]=highest(H,5) and L[1]>L[2] and C<O then PLOT42(H,"CB點",checkbox:=1);
	END;
End;