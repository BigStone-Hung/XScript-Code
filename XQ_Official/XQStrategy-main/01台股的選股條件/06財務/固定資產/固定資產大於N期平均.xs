﻿{@type:filter}
input:N(2);
 if GetField("固定資產")> Average(GetField("固定資產"),N) then ret=1;
 SetTotalBar(3);
 SetOutputName1("固定資產");
 OutputField1(GetField("固定資產"));
 