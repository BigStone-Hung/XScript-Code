{@type:sensor|@guid:3e7e8ea9a3824413a97ef0f0d01b7299}

condition1 = GetQuote("漲跌幅") > 5;
condition2 = close > simpleHighest(getField("Close","D")[1], 5);
condition3 = CurrentTime >= 132000;

if condition1 and condition2 and condition3 then ret = 1;