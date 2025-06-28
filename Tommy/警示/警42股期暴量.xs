{@type:sensor|@guid:12b74a65b83b404e88776360e6137e6e}
Value1 = GetQuote("昨量");
Value2 = GetQuote("總量(日)");

if value2>1000 and value2>value1*3 then ret=1;