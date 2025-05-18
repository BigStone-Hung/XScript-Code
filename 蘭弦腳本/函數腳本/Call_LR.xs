{@type:function}
variable:I(0);
	value1=absvalue(average(GetField("資本支出金額"),3));
	value2=absvalue(average(GetField("資本支出金額"),8));
	value3=summation(GetField("來自營運之現金流量"),4)/summation(GetField("本期稅後淨利"),4);
	If GetField("營業收入淨額")>GetField("營業收入淨額")[4] then I+=1;
	If GetField("營業收入淨額")>GetField("營業收入淨額")[1] then I+=1;
	If GetField("稅前淨利","Q")>GetField("稅前淨利","Q")[1] then I+=1;
	If GetField("營業毛利率","Q")>GetField("營業毛利率","Q")[4] then I+=1; 
	If GetField("應收帳款週轉率(次)","Q")>GetField("應收帳款週轉率(次)","Q")[4] then I+=1; 
	If GetField("存貨週轉率(次)","Q")>GetField("存貨週轉率(次)","Q")[4] then I+=1; 
	If GetField("應收帳款週轉率(次)","Q")+GetField("存貨週轉率(次)","Q")
		> GetField("應收帳款週轉率(次)","Q")[1]+GetField("存貨週轉率(次)","Q")[1] 
	then I+=2; 
	If (GetField("負債比率","Q")<GetField("負債比率","Q")[1]) 
		or (GetField("負債比率","Q")<GetField("負債比率","Q")[4]) 
	then I+=1; 
	If GetField("來自營運之現金流量","Q")>GetField("來自營運之現金流量","Q")[1] 
		and GetField("來自營運之現金流量","Q")>GetField("來自營運之現金流量","Q")[4] 
	then I+=1; 
	If (GetField("來自營運之現金流量","Q")
		+GetField("來自營運之現金流量","Q")[1]
		+GetField("來自營運之現金流量","Q")[2])
		>
		(GetField("本期稅後淨利","Q")
		+GetField("本期稅後淨利","Q")[1]
		+GetField("本期稅後淨利","Q")[2]) 
	then I+=1;
	If value3>1 then I+=2;
	If GetField("股東權益報酬率","Q")>GetField("股東權益報酬率","Q")[1] 
		and GetField("股東權益報酬率","Q")>GetField("股東權益報酬率","Q")[4] 
	then I+=1;
		value401=Iff(GetField("營業外收入合計","Q")>0,iff(GetField("稅前淨利","Q")>GetField("營業外收入合計","Q"),GetField("營業利益","Q"),0.01),maxlist(GetField("營業利益","Q"),GetField("稅前淨利","Q")));
		value402=Iff(GetField("稅前淨利","Q")>0,value401/GetField("稅前淨利","Q"),1);
		If value402>1.1 then value403=1.1 else value403=value402;
		value404=Iff((GetField("每股稅後淨利(元)","Q")*4*value403)>0,close/(GetField("每股稅後淨利(元)","Q")*4*value403),0);
		value801=Iff(value404>=100,99,Iff(value404<=0,0,Round(value404,0)));
		If value801>0 then value900=(CALL_LQ/value801)*100 else value900=0;

Call_LR=value403;
