{@type:indicator|@guid:1897712fc40040af8e44971e59194965}
//日線專用量能
input:plotmode(1,"主副圖:", inputkind:=Dict (["簡易量量",1],["個股日量",2],["個股週量",3]),quickedit:=true);
VAR:KN(0);
//===========================================
IF DAte<>DAte[1] then KN=0;
KN=KN+1;
VALUE21=minList(average(V,8),average(V,21),average(V,55));
VALUE22=Call_BV-VALUE21;
CONDITION3=trueAll(V>Call_BV*2 and V>V[2]*2,2);
CONDITION4=C>O and C=highest(C,13)  and V>average(V,13)*3  and V>V[1]*2 ;
//簡易量能================================================
If plotmode=1 then begin
	Plot1(V,"量能紅柱");
	plot4(call_BV,"大量白線");
End;
//個股日量================================================
If plotmode=2 then begin
	IF SYmbol<>"TSE.TW" then begin
		Plot1(V,"量能紅柱");
		plot2(GetField("當日沖銷張數")+GetField("融資增減"),"散戶黃量",checkbox:=0);
		plot3(GetField("當日沖銷張數"),"當沖綠量");
		plot4(Round(call_BV,0),"大量白線");
		//IF Call_B55>0 and V=highest(V,13) then begin
		IF Call_55B>0 and V>Call_BV and C>Call_MB and TRUEALL(Call_BV[1]<Call_BV[2],3) and Call_BV>Call_BV[1] and C-O>H-C then Plot5(V,"訊號") Else Plot5(0,"訊號");
		//and countIf(V[1]>Call_BV[1],13)>=5 and countIf(Call_BV[1]<Call_BV[2],8)>=5 and countIf(V>Call_BV,5)>=3 and 1=1 
	End;
End;
//個股週量=======================================================
If plotmode=3 then begin
	IF barFreq ="W" or barFreq ="AW" then BEGIN
		Plot1(V,"量能紅柱");
		plot3(GetField("當日沖銷張數"),"當沖綠量");
		plot4(Round(call_BV,0),"大量白線");
		IF V<Call_BV or Call_BV<Call_BV[1] then Plot9(V,"量能綠柱") ELSE Plot9(0,"量能綠柱");
		//IF DAte<>DAte[1] then plot21(GetField("成交量", "D")[1],"跨日黃柱") Else noPlot(21);
	End;
End;
