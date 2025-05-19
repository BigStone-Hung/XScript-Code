{@type:filter|@guid:9e1ab72bff824645967b34a3a3f2b4f1}
setbarfreq("AD");
VALUE1=0;
IF GetField("平均收帳天數","Q")<GetField("平均收帳天數","Q")[4] then value1=value1+1;
IF GetField("平均售貨天數","Q")<GetField("平均售貨天數","Q")[4] then value1=value1+1;
IF GetField("平均收帳天數","Q")[3]<GetField("平均收帳天數","Q")[4] then value1=value1+1;
IF GetField("平均售貨天數","Q")[3]<GetField("平均售貨天數","Q")[4] then value1=value1+1;
IF GetField("來自營運之現金流量","Q")>GetField("來自營運之現金流量","Q")[4] then value1=value1+1;
IF GetField("來自營運之現金流量","Q")[3]>GetField("來自營運之現金流量","Q")[4] then value1=value1+1;
IF VALUE1>=6 and 
	CALL_W55>0 and 
	trueall(GetField("成交金額(元)", "D")>10000000,3) and 
	AVerage(V,5)>AVerage(V,5)[4] 
then RET=1;
outputfield1(VALUE1,"營運SCORE");
outputfield2(GetField("月營收年增率", "M"),"營收累計年增率");
