{@type:function_bool|@guid:d9653e5da1214c25982948f9a2719c61}
SetBarMode(1);//score計分 .......
input: ratio1(numeric); SetInputName(1, "參數");   //5
input: Period1(numeric); SetInputName(2, "天期");  //7
input: Period2(numeric); SetInputName(3, "天期");  //5

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
//5.Supertednd.........................................................................................	
value5=FTI_SuperTrend(10,1.5);  //函數

//出場邏輯
if date<>date[1] then score=0;
if ma20_trendu(c,Period2+15) then score=score+1;  
if value1>=ratio1-2 then score=score+1;
if value2>=Period1+2 then score=score+1;
if value3>=1 then score=score+1;
if value4>=1 then score=score+1;

COM_T0S000_SCO=score<3 and value5<0;