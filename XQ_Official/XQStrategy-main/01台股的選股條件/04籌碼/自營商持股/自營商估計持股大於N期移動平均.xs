﻿{@type:filter}
input:N(2),X(1);
 if Average(GetField("自營商持股"),N) > X then ret=1;
 SetTotalBar(3);
 SetOutputName1("自營商持股");
 OutputField1(GetField("自營商持股"));
 