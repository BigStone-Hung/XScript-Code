{@type:sensor|@guid:5a2e0bae708b47049cf13db019e0ea3c}
condition1= close=q_DailyLow;  //股價創今低
condition2= low<lowest(lowd(1),2);  //股價創3日新低
condition3= (q_InSize/q_DailyVolume)>0.6; //內盤量>60%
condition4= q_EstimatedTotalVolume>(q_PreTotalVolume); //估量>昨量
condition5= q_EstimatedTotalVolume>1500; //估量>1500張

if condition1 
   and condition2
   and condition3 
   and condition4 
   and condition5
then ret=1;