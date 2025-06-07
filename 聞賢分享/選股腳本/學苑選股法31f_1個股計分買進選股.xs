{@type:filter}
//score計分 .......
settotalbar(100);

variable:score(0);
Variable: _pvi(1),up5(0),down5(0),mid5(0),up(0),down(0),mid(0);
//1.SIX...........................................................................
value1=SIX_Sixsum(5,5,5);	
//2.AI_Techscor................
value2 = techscore();
//3.AI_Score1.........................................................................................	
value3=AI_Score1_1();  //函數
//4.AI_Score2.........................................................................................	
value4=AI_Score2_1();  //函數

//進場邏輯
if date<>date[1] then score=0;
if c>average(c,20) or ma20_trendu(c,20) then score=score+1; 
if value1>=3 then score=score+1;
if value2>=7 then score=score+1;
if value3>=1 then score=score+1;
if value4>=1 then score=score+1;
if FTI_SuperTrend(10,1.5)>0 then score=score+1;
if score>=4 and v>5000 then ret=1;

outputfield1(volume,"成交量",order:=1);
outputfield2(value1,"Sixsum");
outputfield3(value2,"techscore");
outputfield4(value3,"Score1");
outputfield5(value4,"Score2");