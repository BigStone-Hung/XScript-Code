{@type:filter|@guid:6eda54459d3c409686b5e2ab70cb6313}
SETBARFreq("AD");
SETTOTALBar(56);
VALUE1=GetField("控盤者買賣超張數", "D");
VALUE2=SUmmation(VALUE1,13);
CONDITION1= VALUE1>0 and VALUE1=HIGHEST(ABsValue(VALUE1),5) and TRueCount(VALUE1[1]<=0,5)>=3;
CONDITION2=VALUE2>0 and TRueAll(VALUE2[1]<=0,4);
CONDITION9=C>O and CALL_55W>0 and MAxList(O,C)-MinList(O,C)>H-MAxList(O,C) and MAxList(O,C)-MinList(O,C)>MinList(O,C)-L;
IF (CONDITION1 or CONDITION2) and CONDITION9 and GetField("累計營收年增率", "M")>0 then RET=1;
outputfield5(GetField("本益比", "D"),"PE");