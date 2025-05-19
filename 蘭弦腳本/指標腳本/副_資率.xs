{@type:indicator|@guid:dfa3ceb10cef4db38c3213eaa490cda2}
input:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["融資判多空",2],["維持率走勢",3]),quickedit:=true);
IF plotmode=1 then begin

End;
IF plotmode=2 then begin
	IF SYmbol="TSE.TW" OR SYmbol="OTC.TW" then PLOT21(GetField("融資維持率")-150,"多空柱");
	IF SYmbol<>"TSE.TW" then PLOT21(GetField("融資維持率")-166,"多空柱");
	PLOT22(0,"零軸");
End;
IF plotmode=3 then begin
	PLOT30(GetField("融資餘額"),"餘額",checkbox:=0);
	PLOT31(GetField("融資維持率"),"維持率");
	PLOT32(130,checkbox:=1);
	PLOT33(150,checkbox:=1);
	PLOT34(166,checkbox:=1);
End;