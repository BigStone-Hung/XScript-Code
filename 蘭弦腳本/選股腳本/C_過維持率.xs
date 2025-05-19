{@type:filter|@guid:0f1a5712a6034f93a06d4dd0d44c8a06}
SETBarFreq("AD");
SETTOtalBar(56);
VALUE1=GetField("融資維持率", "D");
CONDITION1=VALUE1>166 and GetField("融資使用率", "D")>1 and GetField("成交金額(元)", "D")>10000000; 
CONDITION2=lowest(GetField("融資餘額張數", "D"),5)=lowest(GetField("融資餘額張數", "D"),55);
CONDITION3= HIGHEST(H,3)<HIGHEST(H,55);
IF C>L[1] and Call_55W>O 	and CONDITION1 and CONDITION2 and CONDITION3 THEN RET=1;
OUtputField1(VALUE1,"A");
OUtputField2(GetField("融資使用率", "D"),"過維持濾");






