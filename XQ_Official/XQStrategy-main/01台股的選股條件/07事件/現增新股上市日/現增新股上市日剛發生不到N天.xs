﻿{@type:filter}
input:N(2);
 if GetField("現增新股上市日") > 0 then Value1 = -DateDiff(GetField("現增新股上市日"),CurrentDate) else Value1 = -1;
 if Value1 <= N and Value1 >= 0 then ret =1;
 SetTotalBar(3);
 SetOutputName1("現增新股上市日");
 OutputField1(GetField("現增新股上市日"));
 