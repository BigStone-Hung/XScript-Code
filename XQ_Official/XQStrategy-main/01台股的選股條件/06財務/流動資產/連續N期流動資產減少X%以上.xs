﻿{@type:filter}
input:N(2),X(1);
 if TrueAll(RateOfChange(GetField("流動資產"),1) < -1*X,N) then ret=1;
 SetTotalBar(N+2);
 SetOutputName1("流動資產");
 OutputField1(GetField("流動資產"));
 