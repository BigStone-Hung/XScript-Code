﻿{@type:filter}
input:N(1);
 if GetField("開盤價") > GetField("收盤價")[1]*(1+N*0.01)  then ret=1;
 SetTotalBar(3);
 SetOutputName1("開盤價");
 OutputField1(GetField("開盤價"));
 