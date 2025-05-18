{@type:function}
//setbarfreq("Q");
settotalbar(9);
		value400=GetField("每股稅後淨利(元)","Q");
		value401=Iff(GetField("營業外收入合計","Q")>0,iff(GetField("稅前淨利","Q")>GetField("營業外收入合計","Q"),
		         GetField("營業利益","Q"),0.01),maxlist(GetField("營業利益","Q"),GetField("稅前淨利","Q")));
		value402=Iff(GetField("稅前淨利","Q")>0,value401/GetField("稅前淨利","Q"),1);
		If value402>1.1 then value403=1.1 else value403=value402;
		value404=close/(GetField("每股稅後淨利(元)","Q")*4*value403);
		value405=GetField("本期稅後淨利","Q")*value403;
		value1=GetField("稅前息前淨利","Q")*value403;
		value2=GetField("營運資金","Q")+GetField("固定資產","Q");
		value3=GetField("股東權益總額","Q")+GetField("短期借款","Q")+GetField("長期負債","Q")+GetField("一年內到期長期負債","Q")+GetField("應付商業本票","Q");
		value4=value1/value2;
		value5=value1/value3;
		value111=Iff(value1>0,value4,0);//資產報酬率
		value112=Iff(value1>0,value5,0);//盈餘報酬率
If leftstr(symbol,2)<>"28" and value111>0.03 and value112>0.03 then
		begin
			RET=1;
		End;		
Call_KLC=value111+value112;
