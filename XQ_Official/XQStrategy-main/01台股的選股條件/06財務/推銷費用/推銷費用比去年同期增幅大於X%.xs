﻿{@type:filter}
input:X(1);
 if RateOfChange(GetField("推銷費用"),4) > X then ret=1;
 SetTotalBar(3);
 SetOutputName1("推銷費用");
 OutputField1(GetField("推銷費用"));
 SetOutputName2("推銷費用增幅%");
 OutputField2(RateOfChange(GetField("推銷費用"),4));
 