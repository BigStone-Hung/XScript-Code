﻿{@type:filter}
input:N(2);
 if GetField("開盤價") >= Highest(GetField("最高價"),N) then ret=1;
 SetTotalBar(3);
 SetOutputName1("開盤價");
 OutputField1(GetField("開盤價"));
