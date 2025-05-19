{@type:indicator|@guid:1201ccb277db4210b60458ce43256fc8}
//融資券張數趨勢 並加上維持率判斷來區分風險與機會
input:plotmode(1,"圖表選項:", inputkind:=Dict (["資券概況",1],["多空判斷",2],["維持比率",3]),quickedit:=true);

IF plotmode=1 then begin
	PLOT11(GetField("融資餘額張數"),"融資張數",checkbox:=1);
	PLOT12(GetField("借券賣出餘額張數"),"借券張數",checkbox:=1);
	PLOT13(GetField("融券餘額張數"),"融券張數",checkbox:=1);
	CONDITION1=(C>O or C>=C[1]) and GetField("融資餘額張數")=lowest(GetField("融資餘額張數"),89) and GetField("融資餘額張數")>0;
	PLOT15(GetField("融資餘額張數"),"融資畫線",checkbox:=1);
	If CONDITION1 and not(CONDITION1[1]) then PLOT16(1,"訊號",checkbox:=1) else PLOT16(0,"訊號",checkbox:=1);
End;

IF plotmode=2 then begin
	IF SYmbol="TSE.TW" OR SYmbol="OTC.TW" then PLOT21(GetField("融資維持率")-162,"多空柱");
	IF SYmbol<>"TSE.TW" and SYmbol<>"OTC.TW" then PLOT21(GetField("融資維持率")-166,"多空柱");
	PLOT22(0,"零軸");
End;

IF plotmode=3 then begin
	IF SYMBOL="TSE.TW" or SYMBOL="OTC.TW" THEN 
		BEGIN
			PLOTFILL(32,134,162,"風險區");
			PLOTFILL(33,163,180,"觀察區");
			PLOT35(GetField("融資維持率"),"維持率");
		END
		ELSE
		BEGIN
			PLOTFILL(32,134,166,"風險區");
			PLOTFILL(33,163,180,"觀察區");
			PLOT35(GetField("融資維持率"),"維持率");
		END;
End;
