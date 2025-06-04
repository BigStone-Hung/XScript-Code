{@type:function}
SetBarMode(1);// XQ: sar20
Variable: _pvi(1),up5(0),down5(0),mid5(0),up(0),down(0),mid(0);
variable: count(0);
//每天的分數都先歸零
//if date <> date[1] then 
	count=0;
//1.PVI.........................................................................................	
If CurrentBar = 1 then
	_pvi = 1
else
  begin	
	if Volume > Volume[1] then
		_pvi = _pvi[1] + (Close - Close[1]) / Close[1]
	else
		_pvi = _pvi[1];
  end;
value1=average(_pvi,5);
value2=_pvi-average(_pvi,5);

up = bollingerband(C, 20, 2);
down = bollingerband(C, 20, -2);
if up - down = 0 then value3 = 0 else value3 = (C - down) * 100 / (up - down);

up5 = bollingerband(value1, 20, 2);
down5 = bollingerband(value1, 20, -2 );
if up5 - down5 = 0 then value4 = 0 else value4 = (value1 - down5) * 100 / (up5 - down5);
value5=value4-value3;

if value5>0 then
	count=count+1;

//2.亞歷山大.......................................................................................
Value6 = close / close[10-1];
if value6>1 then count=count+1;

AI_Score2_1=count;	 //sar下降