{@type:indicator|@guid:7a5e2872ba7443cb82947429755b2a14}

inputs:aa(10,"斜率");

variable: adi(0);

settotalBar(300);

if Close > Close[1] then
	adi = adi[1] + (Close - minlist(low, close[1])) 
else
  begin
	if Close < Close[1] then
		adi = adi[1] - (maxlist(high, close[1]) - close)
	else
		adi = adi[1];
  end;

 value1 = linearRegSlope(adi,aa);
 
 
 plot1(value1);
 
 