{@type:filter|@guid:97aedd2757d742a8b6cdc1aeb6da1ba7}
IF GetSymbolInfo("有可轉債") then begin
	IF C>CALL_CBP*0.9 and CALL_CBR<61.8 then ret=1;
	//IF ISLastBar then begin
	Print(File("C:\Users\about\Desktop\CB選股.txt"), date,symbol,close);
	//End;
End;
