﻿{@type:filter}
input:N(2),X(1);
 if TrueAll(RateOfChange(GetField("融券餘額張數"),1) > X,N) then ret=1;
 SetTotalBar(N+2);
 SetOutputName1("融券餘額張數");
 OutputField1(GetField("融券餘額張數"));
 