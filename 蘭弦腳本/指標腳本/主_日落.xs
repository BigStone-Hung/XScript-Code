{@type:indicator|@guid:f78223ece7f544d0b2384ced605e4e83}
input:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["多空柱",2]),quickedit:=true);
VALUE1=AVERAGE((HIGHEST(H,89)+LOWest(L,89))/2,13);
CONDITION1=VALUE1>=VALUE1[1] and C>VALUE1; 
IF plotmode=1 then begin
	//PLOT4(VALUE1*1.13,"上軌",checkbox:=0);
	//PLOT5(VALUE1*0.92,"下軌",checkbox:=0);
	IF CONDITION1 then PLOT1(VALUE1*1.00,"基本防守",checkbox:=1) Else NOPlot(1);
	IF Call_MP>0 and Call_MP>=Call_MP[1] and H>=Call_MP then PLOT2(Call_MP,"緩漲防守",checkbox:=1) Else NOPlot(2);

	IF Call_AO>0 and Call_AO[1]=HIGHEST(Call_AO,34) then begin
		VALUE3=VALUE2;
		IF LOWEST(C,3)*0.98>VALUE2 THEN VALUE2=LOWEST(C,3)*0.98;
	End;
	IF VALUE2>0 and H>Call_MP and TRUEALL(C>VALUE2,3) then PLOT3(VALUE2,"混沌防守",checkbox:=1) Else NOPLOT(3);
	IF H<VALUE2 THEN begin
		VALUE2=0;
		VALUE3=0;
	End;	
	IF Call_MB>0 and Call_MB>=Call_MB[1] and H>=Call_MB then PLOT4(Call_MB,"急漲防守",checkbox:=1) Else NOPlot(4);
End;
