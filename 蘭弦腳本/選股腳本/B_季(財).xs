{@type:filter|@guid:f6bbb4d232704fe6b6a61f907fe25c57}
SETBARFreq("Q");
SETTOTALBar(5);
value1=C/(GetField("每股稅後淨利(元)", "Q")*4);
Condition1=VALUE1>5;
Condition2=GetField("平均收帳天數", "Q")<GetField("平均收帳天數", "Q")[1] 
	or GetField("平均售貨天數", "Q")<GetField("平均售貨天數", "Q")[1] 
	or GetField("來自營運之現金流量", "Q")>GetField("來自營運之現金流量", "Q")[1]
	or GetField("負債比率", "Q")<GetField("負債比率", "Q")[1];
IF Condition1 and Condition2 then ret=1; 