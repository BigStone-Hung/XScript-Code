{@type:indicator|@guid:413854ca4e434b649c96ed4479f16df1}
//主圖月K  觀察營收趨勢與同期比較之用
input:plotmode(1,"主副圖:", inputkind:=Dict (["營收",1],["比率",2]),quickedit:=true);
if barfreq<>"M" and barfreq<>"AM" then return;
SETFIrstBarDate(20050101);
VALUE1=GetField("月營收", "M");
VALUE2=GetField("月營收", "M")[12];
IF plotmode=1 then begin
	PLOT1(VALUE1);
	PLOT2(VALUE2);
	PLOT3(VALUE1);
END;
IF plotmode=2 then begin
	VALUE11=GetField("存貨", "Q")/(VALUE1*100);
	PLOT11(average(VALUE11,13)-VALUE11,"存銷比率",checkbox:=0);
END;
