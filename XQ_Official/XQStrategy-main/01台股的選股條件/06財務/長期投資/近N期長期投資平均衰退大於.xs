﻿{@type:filter}
input:N(3),X(20);
 if average(rateofchange(GetField("長期投資"),1),N)<-X then ret=1;
 SetTotalBar(3);
 SetOutputName1("長期投資平均衰退");
 OutputField1(average(rateofchange(GetField("長期投資"),1),N));
 