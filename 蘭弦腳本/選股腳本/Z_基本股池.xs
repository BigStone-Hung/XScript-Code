{@type:filter|@guid:66282d390e944f03989954e8c73ef49a}
SETBarFreq("AD");
SETTOtalBar(8);
VALUE1=absValue(C-O)/MINList(C,O);
CONDITION1= GetField("股本(億)", "D")>5 and GetField("股本(億)", "D")<150 and trueall(GetField("成交金額(元)", "D")>100000000,5);
IF GetSymbolInfo("買賣現沖")=true and LEftStr(SYmbol,1)<>"0" and GetField("融資餘額佔股本比例", "D")>0 then begin
	IF CONDITION1 AND GetField("週轉率", "D")>1.3 then RET=1; 
End;
OUTputField1(GetField("股本(億)", "D"),"股本(億)");
OUTputField2(GetField("融資餘額佔股本比例", "D"),"融資");
OUTputField3(GetField("週轉率", "D")[1],"週轉率");
OUTputField4(V[1]>V[2],"量增");
OUTputField5(L[1]>L[2],"墊高");
OUTputField6(GetField("漲跌幅", "D")[1],"漲跌幅");




