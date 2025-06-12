{@type:sensor|@guid:41ad7a74c77f45dd9d225a894a9e1968}
var: Kbar(0), myTimes(0), i(0), newHigh(0);
var: HasRet(false);
if HasRet = true then return;
if BarFreq <> "Min" or BarInterval <> 1 then RaiseRunTimeError("請使用1分鐘頻率");

if date <> date[1] then Kbar = 0;
Kbar = Kbar + 1;
if time = 090300 or time = 090400 or time = 090500 then begin
	i = Kbar - 1;
	newHigh = h[i];
	myTimes = 0;
	i = i - 1;
	while i >= 0 begin
		if h[i] > newHigh then begin
			newHigh = h[i];
			myTimes = myTimes + 1;
			if myTimes = 2 then begin
				ret = 1;
				HasRet = true;
				break;
			end;
		end;
		i = i - 1;
	end;
end;

