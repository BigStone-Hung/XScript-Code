﻿{@type:filter}
input:N(2);
 if GetField("每股淨值(元)") > Highest(GetField("每股淨值(元)")[1],N) then ret=1;
 SetTotalBar(3);
 SetOutputName1("每股淨值(元)");
 OutputField1(GetField("每股淨值(元)"));
