﻿{@type:filter}
input:N(2),M(1),X(1);
 if countif(GetField("員工平均營業額(千元)")>X,N) >= M then ret=1;
 SetTotalBar(3);
 SetOutputName1("員工平均營業額(千元)");
 SetOutputName2("符合期數");
 OutputField1(GetField("員工平均營業額(千元)"));
 OutputField2(countif(GetField("員工平均營業額(千元)")>X,N));
 