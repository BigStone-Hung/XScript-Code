﻿{@type:filter}
input:N(2),X(1);
 if Summation(GetField("投信買賣超"),N)/Summation(GetField("成交量"),N) > 0.01*X then ret=1;
 SetTotalBar(3);
 SetOutputName1("投信買賣超合計");
 OutputField1(Summation(GetField("投信買賣超"),N));
 