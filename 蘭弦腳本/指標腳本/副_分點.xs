{@type:indicator}
input:plotmode(1,"副圖:", inputkind:=Dict (["籌碼布林",1],["分點趨勢",2]),quickedit:=true);
VALUE1=GetField("控盤者買張");
VALUE2=-GetField("散戶賣張");
VALUE3=VALUE1-VALUE2;
VALUE4=BOllingerBand(VALUE3,21,2);
VALUE5=BOllingerBand(VALUE3,21,-2);
VALUE11=summation(GetField("分公司淨賣超金額家數", "D")-GetField("分公司淨買超金額家數", "D"),13);
CONDITION1=C>O and V>Call_BV and V<Call_BV*2 
	and (VALUE4>VALUE4[1] and VALUE5<VALUE5[1])	and VALUE11>0;
IF PLOTMODE=1 then begin
	PLOT1(VALUE1);
	PLOT2(VALUE2);
	PLOT3(VALUE4);
	PLOT4(VALUE5);
	//IF CONDITION1 THEN PLOT5(0);
End;
IF PLOTMODE=2 then begin
	Plot11(VALUE11,"分");
End;		
IF CONDITION1 then plot21(1,"訊號") else plot21(0,"訊號");
	