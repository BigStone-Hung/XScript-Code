{@type:indicator|@guid:b14cf730a7b4454ca1f295e537d7c65e}
array: T10[10](0);
t10[1] = GetSymbolField("2330.tw", "收盤價");{台積電}
t10[2] = GetSymbolField("2454.tw", "收盤價");{聯發科}
t10[3] = GetSymbolField("2317.tw", "收盤價");{鴻海}
t10[4] = GetSymbolField("2412.tw", "收盤價");{中華電}
t10[5] = GetSymbolField("6505.tw", "收盤價");{台塑化}
t10[6] = GetSymbolField("2881.tw", "收盤價");{富邦金}
t10[7] = GetSymbolField("2882.tw", "收盤價");
t10[8] = GetSymbolField("2603.tw", "收盤價");
t10[9] = GetSymbolField("1303.tw", "收盤價");
t10[10] = GetSymbolField("2308.tw", "收盤價");

var: count(0), i(0);
count = 0;
for i = 1 to 10
begin
	if average(t10[i], 5) > average(t10[i], 20) then 
		count = count + 1;
end;

plot1(count);
plot2(5);