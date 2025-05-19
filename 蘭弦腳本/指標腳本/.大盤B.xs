{@type:indicator|@guid:4b71af47a44345a4bf5f3f05902977e1}
input:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["大盤VS台積成交值",2],["台積佔比",3]),quickedit:=true);
VALUE1=GetSymbolField("TSE.TW", "成交金額(元)");
VALUE2=GetSymbolField("2330.TW", "成交金額(元)");
VALUE3=ROUND((VALUE2/VALUE1)*100,0);
CONDITION1=H<H[1] and L<L[1] and VALUE3>13 and TRueAll(C<O,2);
CONDITION2=C>O and VALUE3*2>34 and VALUE3>VALUE3[1]*2;
IF plotmode=1 then begin
	IF CONDITION1 or CONDITION2 then PLOT11(L*0.98,"量化點");
End;
IF plotmode=2 then begin
	PLOT21(VALUE1,"大盤成交值");
	PLOT22(VALUE2*2,"台積成交值");
End;
IF plotmode=3 then begin
	PLOT31(VALUE3,"台積佔比");
	PLOT32(13,"上警示");
	PLOT33(5,"下警示");
End;

