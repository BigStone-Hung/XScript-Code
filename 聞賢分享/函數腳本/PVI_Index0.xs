{@type:function|@guid:97d27b1696c44de59c707ddf3c93d39c}
// XQ: PVI指標
SetBarMode(2);
Input: ratio1(numericSeries);

Variable: _pvi(1),up5(0),down5(0),mid5(0),up(0),down(0),mid(0);
//PVI.................................................................................................
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
	
PVI_Index0=value5;