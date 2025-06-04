{@type:function_bool}
SetBarMode(1);//score計分 .......
input: ratio1(numeric); SetInputName(1, "參數");  //5
input: Period1(numeric); SetInputName(2, "天期");//7
input: Period2(numeric); SetInputName(3, "天期");//20

variable:score(0);

//1.SIX...........................................................................
value1=SIX_Sixsum(5,5,5);	
//2.AI_Techscor................
value2 = techscore();
//3.AI_Score1.........................................................................................	
value3=AI_Score1_1();  //函數
//4.AI_Score2.........................................................................................	
value4=AI_Score2_1();  //函數
//5.Supertednd.........................................................................................	
value5=FTI_SuperTrend(10,1.5);  //函數

//進場邏輯
if date<>date[1] then score=0;
if ma20_trendu(c,Period2+15) then score=score+1;  
if value1>=ratio1-2 then score=score+1;
if value2>=Period1+2 then score=score+1;
if value3>=1 then score=score+1;
if value4>=1 then score=score+1;

K1B_ScoreB=score>=3 and value5>0;