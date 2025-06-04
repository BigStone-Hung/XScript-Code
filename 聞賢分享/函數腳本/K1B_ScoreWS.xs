{@type:function_bool|@guid:c09f56d90f2f4229874ea5dcf950c673}
SetBarMode(1);//score計分 .......
input: ratio1(numeric); SetInputName(1, "參數");  //5
input: Period1(numeric); SetInputName(2, "天期");//7
input: Period2(numeric); SetInputName(3, "天期");//20

variable:score(0);
Variable: _pvi(1),up5(0),down5(0),mid5(0),up(0),down(0),mid(0);
//1.SIX...........................................................................
value1=SIX_Sixsum(5,5,5);
//2.大盤多空對策判斷分數15................
value2 = Foreign_TBS15();
//3.大盤綜合評分5................
value3 = Foreign_TBS(7,5);
//4.PVI.........................................................................................	
value4=PVI_Index0(5);  //函數
//5.亞歷山大.......................................................................................
Value5 = close / close[9];

//6.FTI_Supertrend
value6 = FTI_SuperTrend(10,1.5);
//進場邏輯
if date<>date[1] then score=0;
if c>average(c,period1+15) and value1>=ratio1-2 then score=score+1; 
if value2>=period2+5 or (value2<period2+5 and value2>value2[1]) then score=score+1; 
if value3>0 then score=score+1;
if value4>=0 then score=score+1;
if value5>1 then score=score+1;

K1B_ScoreWS=score<3 and value6<0;