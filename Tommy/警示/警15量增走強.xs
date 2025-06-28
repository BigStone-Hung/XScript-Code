{@type:sensor|@guid:828ce8c51136449a8efaaf9a631815f2}
condition1= close=q_DailyHigh;  //股價創今高
condition2= high>highest(highd(1),2);  //股價創3日新高
condition3= (q_OutSize/q_DailyVolume)>0.6; //外盤量>60%
condition4= q_EstimatedTotalVolume>(q_PreTotalVolume*1.5); //估量>昨量1.5倍
condition5= q_EstimatedTotalVolume>1500; //估量>1500張

if condition1
   and condition2
   and condition3 
   and condition4 
   and condition5
then ret=1;

