﻿{@type:filter}
input:N(2);
 if GetField("資產總額")> Average(GetField("資產總額"),N) then ret=1;
 SetTotalBar(3);
 SetOutputName1("資產總額");
 OutputField1(GetField("資產總額"));
