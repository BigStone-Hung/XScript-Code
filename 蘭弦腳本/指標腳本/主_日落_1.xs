{@type:indicator|@guid:a533759554b64de0ae22a5db319c001e}
//股票波段出場用
VAR:BAO(0),AAO(0);
VALUE1=HIGHEST(H[1],34)/LOWest(L[1],89);
CONDITION1=VALUE1>1.55 and average(C,21)>average(C,21)[1];
IF Call_MP>0 and trueAny(C>Call_MP,3) then PLOT2(Call_MP,"緩漲防守",checkbox:=1) Else NOPlot(2);
IF Call_AO>0 and Call_AO[1]=HIGHEST(Call_AO,34) then begin
	BAO=AAO;
	IF LOWEST(C,3)*0.98>BAO THEN AAO=LOWEST(C,3)*0.98;
End;
IF AAO>0 and AAO>=AAO[1] and trueAny(C>AAO,3) then PLOT3(AAO,"混沌防守",checkbox:=1) Else NOPLOT(3);
IF TRUEALL(H<AAO,3) THEN begin
	AAO=0;
	BAO=0;
End;	
IF CONDITION1 and Call_MB>0 and Call_MB>=Call_MB[1] then PLOT4(Call_MB,"急漲防守",checkbox:=1) Else NOPlot(4);


