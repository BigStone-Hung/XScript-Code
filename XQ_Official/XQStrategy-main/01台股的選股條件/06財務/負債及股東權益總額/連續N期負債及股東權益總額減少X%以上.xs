﻿{@type:filter}
input:N(2),X(1);
 if TrueAll(RateOfChange(GetField("負債及股東權益總額"),1) < -1*X,N) then ret=1;
 SetTotalBar(N+2);
 SetOutputName1("負債及股東權益總額");
 OutputField1(GetField("負債及股東權益總額"));
 