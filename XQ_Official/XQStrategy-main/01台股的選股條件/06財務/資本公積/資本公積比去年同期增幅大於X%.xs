﻿{@type:filter}
input:X(1);
 if RateOfChange(GetField("資本公積"),4) > X then ret=1;
 SetTotalBar(3);
 SetOutputName1("資本公積");
 OutputField1(GetField("資本公積"));
 SetOutputName2("資本公積增幅%");
 OutputField2(RateOfChange(GetField("資本公積"),4));
 