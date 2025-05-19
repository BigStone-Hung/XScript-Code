{@type:filter|@guid:396783ecd0154be4ab75f865f1beb0be}
SETBARFreq("AD");
settotalBar(89);
VAR:i(0),AO(0);
VALUE99=0;
//A量能=============================================================
VALUE91=0;
IF Call_55B>0 and V>Call_BV and C>Call_MB and TRUEALL(Call_BV[1]<Call_BV[2],3) and Call_BV>Call_BV[1] and C-O>H-C then VALUE91=1 Else VALUE91=0;
//B混沌============================================================
VALUE92=0;
AO = (average((high + low)/2,5) - average((high + low)/2,34))/C;
CONDITION21=trueAll(AO>0,3) and AO>AO[1] and AO[1]<AO[2] and lowest(L,2)=lowest(L,4);
CONDITION22=trueAll(AO[1]<0,5) and (C>O and AO[1]<0 and AO>0);
//IF Call_55B>0 and (CONDITION21 or CONDITION22) and V>V[1] and Call_BV>Call_BV[1] and ((average((high + low)/2,5) - average((high + low)/2,34))/C)/C<0.13 then VALUE92=1 ELSE VALUE92=0;
//C集保===========================================
VALUE93=0;
VALUE31=GetField("大戶持股比例", param := 600);
VALUE32=GetField("總持股人數", "W");
CONDITION31= VALUE32=lowest(VALUE32,8) and C=highest(C,5) and value31>value31[1] and value32<value32[1];
IF CONdition31 and not(trueAny(CONdition31[1],8)) then VALUE93=1 else VALUE93=0;
//D資券===========================================
VALUE94=0;
CONDITION41=(C>O or C>=C[1]) and GetField("融資餘額張數")=lowest(GetField("融資餘額張數"),89) and GetField("融資餘額張數")>0;
If CONDITION41 and not(CONDITION41[1]) then VALUE94=1 else VALUE94=0;
//威廉訊號===================================================================
VALUE95=0;
VALUE51=percentr(55)-50;
VALUE52=(bias(21)+bias(34));
CONDITION51=trueAll(VALUE51[1]<0,3) and VALUE51>VALUE51[1] and V>V[1];
CONDITION52=(VALUE52[1]>0 and VALUE52>0) or (VALUE51[1]<0 and VALUE51>0);
If CONDITION51 and CONDITION52 and not(CONDITION52[1]) then VALUE95=1 else VALUE95=0;
//法人訊號================================================
VALUE96=0;
CONDITION62=(GetField("投信持股比例", "D")+GetField("外資持股比例", "D"))=highest((GetField("投信持股比例", "D")+GetField("外資持股比例", "D")),34);
IF C>O and Call_55B>0 and CONDITION62 and NOT(CONDITION62[1]) then VALUE96=1 else VALUE96=0;
//合計========================================================================
IF trueAny(value91=1,4) then VALUE99=VALUE99+1;
IF trueAny(value92=1,4) then VALUE99=VALUE99+1;
IF trueAny(value93=1,5) then VALUE99=VALUE99+1;
IF trueAny(value94=1,4) then VALUE99=VALUE99+1;
IF trueAny(value95=1,4) then VALUE99=VALUE99+1;
IF trueAny(value96=1,4) then VALUE99=VALUE99+1;
IF RIGHTStr(SYmbolName,2)<>"KY" and trueAny(C<C[1],3) 
	and Call_BV>Call_BV[1] and V<Call_BV*2 and value99>=3 
	and Call_55W>0 and HIGHEST(H,3)<HIGHEST(H,55)
	and (value91=1 or value92=1 or value93=1 or value94=1 or value95=1 or value96=1) and average(GetField("成交金額(元)", "D"),3)>30000000 then RET=1;
//RET=1;
outputField1(VALUE99,"合計");
outputField2(trueAny(value91=1,4),"量能");
outputField3(trueAny(value92=1,4),"混沌");
outputField4(trueAny(value93=1,5),"集保");
outputField5(trueAny(value94=1,4),"資券");
outputField6(trueAny(value95=1,4),"威廉");
outputField7(trueAny(value96=1,4),"法人");



