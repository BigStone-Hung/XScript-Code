﻿{@type:filter}
input:N(2);
 if TrueAll(GetField("最高價") = GetField("漲停價"),N) then ret=1;
 SetTotalBar(3);
 SetOutputName1("漲停價");
 OutputField1(GetField("漲停價"));
 