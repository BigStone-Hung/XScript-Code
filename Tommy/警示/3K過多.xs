{@type:sensor|@guid:c5f7d3cc54fc4cb7b74cfcf84c8c6276}
input: ds(2,"days"), hloc(0,"影線");
var:hp(0), lp(0), ULine(0), DLine(0), LsH(0), LsL(0), Con(0), MAL(0);			

//三Ｋ法
if hloc=1 then
	begin
		hp=High;
		lp=Low;
	end
else
	begin
		hp=MaxList(O,C);
		lp=MinList(O,C);
	end;

ULine=Highest(hp,ds);
DLine=Lowest(lp,ds);

Condition51=H[1]<L[2] and L>H[1];                 //島狀反轉
Condition52=C[1]<L[2] and V[1]>V[2] and C>H[1];   //過待量破Ｋ線
Condition53=(C[1]<ULine[2] and C>ULine[1]) or (C[2]<ULine[3] and C[1]=ULine[2] and C>ULine[1]); //三盤過
Condition54=Condition51 or Condition52 or Condition53;

MAL=Average(C,10);

if Condition54 and C>MAL then ret=1;