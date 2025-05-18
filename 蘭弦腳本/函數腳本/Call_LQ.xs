{@type:function}
settotalBar(10);
variable:I(0);
I=0;
value1=absvalue(average(GetField("資本支出金額","Q"),3));
value2=absvalue(average(GetField("資本支出金額","Q"),8));
value3=summation(GetField("來自營運之現金流量","Q"),4)/summation(GetField("本期稅後淨利","Q"),4);
//==============================================================================
If GetField("營業收入淨額","Q")>GetField("營業收入淨額","Q")[4] then I+=1;//1
If GetField("營業收入淨額","Q")>GetField("營業收入淨額","Q")[1] then I+=1;//2
If GetField("稅前淨利","Q")>GetField("稅前淨利","Q")[1] then I+=1;//3
If GetField("營業毛利率","Q")>GetField("營業毛利率","Q")[4] then I+=1;//4 
If GetField("應收帳款週轉率(次)","Q")>GetField("應收帳款週轉率(次)","Q")[4] then I+=1; //5
If GetField("存貨週轉率(次)","Q")>GetField("存貨週轉率(次)","Q")[4] then I+=1; //6
If GetField("應收帳款週轉率(次)","Q")+GetField("存貨週轉率(次)","Q")
	> GetField("應收帳款週轉率(次)","Q")[1]+GetField("存貨週轉率(次)","Q")[1] 
then I+=2; 																		//7+8
If (GetField("負債比率","Q")<GetField("負債比率","Q")[1]) 
	or (GetField("負債比率","Q")<GetField("負債比率","Q")[4]) 
then I+=1; 																			//9
If GetField("來自營運之現金流量","Q")>GetField("來自營運之現金流量","Q")[1] 
	and GetField("來自營運之現金流量","Q")>GetField("來自營運之現金流量","Q")[4] 
then I+=1; 																			//10
If (GetField("來自營運之現金流量","Q")
	+GetField("來自營運之現金流量","Q")[1]
	+GetField("來自營運之現金流量","Q")[2])
	>
	(GetField("本期稅後淨利","Q")
	+GetField("本期稅後淨利","Q")[1]
	+GetField("本期稅後淨利","Q")[2]) 
then I+=1;																				//11
If value3>1 then I+=2;	
															//12+13
//If GetField("股東權益報酬率","Q")>GetField("股東權益報酬率","Q")[1] 
	//and GetField("股東權益報酬率","Q")>GetField("股東權益報酬率","Q")[4] 
//then I+=1;

If GetField("ROE", "Q")>GetField("ROE","Q")[1] 
	and GetField("ROE","Q")>GetField("ROE","Q")[4] 
then I+=1;	
																			//14
If value1>value2 then I+=1;	 													//15
Call_LQ=I;

