﻿{@type:filter}
input:X(1);
 if GetField("月平均收益率") < X then ret=1;
 SetTotalBar(3);
 SetOutputName1("月平均收益率");
 OutputField1(GetField("月平均收益率"));
 