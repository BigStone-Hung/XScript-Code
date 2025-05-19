{@type:indicator|@guid:6e9c5cc73fb64bc4948dd0bf5b22a3b0}
VALUE1=GetField("控盤者買賣超張數", "D");
VALUE2=SUmmation(VALUE1,13);
CONDITION1=VALUE1>0 and VALUE1=HIGHEST(ABsValue(VALUE1),5) and TRueCount(VALUE1[1]<=0,5)>=3;
CONDITION2=VALUE2>0 and TRueAll(VALUE2[1]<=0,4);
CONDITION9=C>O and Call_55W>0 and MAxList(O,C)-MinList(O,C)>H-MAxList(O,C) and MAxList(O,C)-MinList(O,C)>MinList(O,C)-L;
PLOT11(VALUE2,"累積藍柱",checkbox:=1);
PLOT12(VALUE1,"控盤量柱",checkbox:=1);
IF CONDITION1 and CONDITION9 and not(CONDITION1[1]) then PLOT21(1,"訊號A",checkbox:=1) else plot21(0,"訊號A",checkbox:=1);
IF CONDITION2 and CONDITION9 then PLOT22(1,"訊號B",checkbox:=1) else plot22(0,"訊號B",checkbox:=1);


