{@type:filter|@guid:d35c57126f6e42da85341d0255a73c5c}
setbarFreq("AD");
SETTOtalBar(145);
variable:I(0),J(0);
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
CONDItion1=lowest(L,2)>lowest(L,5) and value5>5 and value6<=5 and Call_BV>Call_BV[1] and C>O and Call_55B>0;
IF C>(H+L)/2 and CONDITION1 and not(trueAny(CONDITION1[1],8)) 
	and H>O[2] and V<CALL_BV*3 and V>CALL_BV and V<Call_BV*2 
	and CALL_MP>CALL_MP[1] and L>CALL_MP then begin  //and H>H[1] 
	RET=1;
END;

{
outputfield1(value3,"大盤低點日");
outputfield2(value4,"起點");
outputfield3(value5,"漲幅");
outputfield4(value6,"高差");
print(file("C:\Users\Administrator\Desktop\歐尼爾RPS.CSV"),leftstr(symbol,4),",",value5,",",value6);
}