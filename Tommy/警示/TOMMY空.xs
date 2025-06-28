{@type:sensor|@guid:be8790277ead4e3185fd236ac2997b6b}
condition1= close<q_DailyHigh*0.975;  //今高回檔2.5%以上
condition2= close=q_DailyLow;  //股價創今低
condition3= low<lowest(lowd(1),5);  //股價創5日新低
condition4= q_DailyVolume>300; //總量>300張
condition5= (q_InSize/q_DailyVolume)>0.6; //內盤量>60%
condition6= q_EstimatedTotalVolume>(q_PreTotalVolume*2); //估量>昨量2倍
condition7= q_EstimatedTotalVolume>1500; //估量>1500張

if time>090300 and q_DailyVolume<>0 and q_EstimatedTotalVolume<>0 and q_OutSize<>0 then begin
   if condition1 and condition2 and condition3 and condition4 and condition5 and condition6 and condition7
   then ret=1;
end;