﻿{@type:filter}
input:N(1);
 if GetField("資產總額") > N*100 then ret=1;
 SetTotalBar(3);
 SetOutputName1("資產總額(百萬)");
 OutputField1(GetField("資產總額"));
