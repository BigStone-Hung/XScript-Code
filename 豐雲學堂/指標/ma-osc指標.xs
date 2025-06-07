{@type:indicator|@guid:dd7c4394e2c44e6f89154ef41fa05878}
// XQ: MA-Osc
//
input: Length1(5, "短週期"), Length2(10, "長週期");

value1 = Average(close, Length1);
value2 = Average(close, Length2);
value3 = (value1 - value2);

Plot1(value3, "MA-Osc");
