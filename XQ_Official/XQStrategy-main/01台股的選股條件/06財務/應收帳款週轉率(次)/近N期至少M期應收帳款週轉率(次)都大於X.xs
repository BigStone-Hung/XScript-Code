﻿{@type:filter}
input:N(2),M(1),X(1);
 if countif(GetField("應收帳款週轉率(次)")>X,N) >= M then ret=1;
 SetTotalBar(3);
 SetOutputName1("應收帳款週轉率(次)");
 SetOutputName2("符合期數");
 OutputField1(GetField("應收帳款週轉率(次)"));
 OutputField2(countif(GetField("應收帳款週轉率(次)")>X,N));
 