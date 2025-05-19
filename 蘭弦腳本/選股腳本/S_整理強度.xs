{@type:filter|@guid:180dcf5ec9b94686910b9e26b206e45b}
setbarfreq("AD");
settotalbar(1);
setbackbar(90);
variable:I(0),J(0),K(89);
value1=lowest(GetSymbolField("TSE.TW","最低價","D"),K);
For J=0 to K
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
IF H<>highest(H,8) and lowest(L,2)>lowest(L,5) and value5>5 and value6<=5 and V>100 and C<O and call_55B>0 and GetField("每股稅後淨利(元)","Q")>0 then
RET=1;
outputfield1(value3,"大盤低點日");
outputfield2(value4,"起點");
outputfield3(value5,"漲幅");
outputfield4(value6,"高差");
print(file("C:\Users\Administrator\Desktop\歐尼爾RPS.CSV"),leftstr(symbol,4),",",value5,",",value6);