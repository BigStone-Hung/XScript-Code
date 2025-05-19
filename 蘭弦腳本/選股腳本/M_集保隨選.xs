{@type:filter|@guid:75b05f66d6ca429c948271429825e7fc}
setbarfreq("AD");
settotalbar(13);
VALUE1=iff(GetField("總持股人數", "W")<>0,GetField("大戶持股比例", "W", param := 600)-GetField("大戶持股比例", "W", param := 600)[1],GetField("大戶持股比例", "W", param := 600)[1]-GetField("大戶持股比例", "W", param := 600)[2]);
VALUE2=iff(GetField("總持股人數", "W")<>0,GetField("總持股人數", "W")-GetField("總持股人數", "W")[1],GetField("總持股人數", "W")[1]-GetField("總持股人數", "W")[2]);
CONDITION1=VALUE1>0.2 and VALUE2<0 and H<>HIGHEST(H,8);
IF CONDITION1 and average(GetField("融資餘額張數", "D"),5)<average(GetField("融資餘額張數", "D"),5)[1] and GetField("累計營收年增率", "M")>0 then RET=1;
OUTputField1(VALUE1);
OUTputField2(VALUE2);
