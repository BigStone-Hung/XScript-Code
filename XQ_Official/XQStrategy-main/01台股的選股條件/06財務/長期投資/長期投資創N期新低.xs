﻿{@type:filter}
input:N(2);
 if GetField("長期投資") < Lowest(GetField("長期投資")[1],N) then ret=1;
 SetTotalBar(N+1);
 SetOutputName1("長期投資");
 OutputField1(GetField("長期投資"));
 