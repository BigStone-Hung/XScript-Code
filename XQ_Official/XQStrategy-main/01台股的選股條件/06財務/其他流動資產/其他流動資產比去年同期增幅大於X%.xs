﻿{@type:filter}
input:X(1);
 if RateOfChange(GetField("其他流動資產"),4) > X then ret=1;
 SetTotalBar(3);
 SetOutputName1("其他流動資產");
 OutputField1(GetField("其他流動資產"));
 SetOutputName2("其他流動資產增幅%");
 OutputField2(RateOfChange(GetField("其他流動資產"),4));
 