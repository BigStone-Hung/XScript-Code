{@type:sensor|@guid:3fa8d0b4ff044b5ab089bf5738bd9496}
{腳本執行請使用分鐘頻率，並且每日盤前應該重新執行腳本、重新輸入成本與保利條件}
variable: MA(0),intrabarpersist profit_go(0),intraBarPersist control_cost(0);
input:days(5,"均線天數"),cost(0,"輸入進場成本"),gap(4,"獲利拉開n元觸發保利"),
      loss(0,"最大虧損幾元"),save_asset(2,"保利設定(成本之上n元)");
MA = average(close, days);	                        
Once(getinfo("IsRealTime")=1) 
control_cost=average(getField("控盤者成本線", "AD")[1],days);  

//紀錄盤中是否曾經拉開成本到gap元，只做一次
Once(c>=(cost+gap) and getinfo("IsRealTime")=1) profit_go=1; //獲利拉開gap元，profit_go=1代表符合啟動保利
condition2= c cross under control_cost;   //條件2. 跌破控盤者成本線5日均線，請留意cross under如果
                                          //        原本就在value1之下，不會觸發，要往下穿越才會。
condition3= c < cost-loss;                //條件3. 虧損超過loss元
condition4= c cross under MA;             //條件4. 跌破5MA
if profit_go=1 then 
  begin
    condition1= c <= (cost+save_asset);   //條件1. 保利，回到成本+ n元就出場 
	if (condition1 or condition2 or condition3 or condition4)then 
	 begin 
	    ret=1; 
	 end;
  end
else 
  begin 
    if (condition2 or  condition3 or condition4 )then 
	 begin  
	    ret=1; 
	 end;
  end;
 