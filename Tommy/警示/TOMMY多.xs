{@type:sensor|@guid:ca4a2de85f52458dab34322453160494}
condition1= close>q_DailyLow*1.025 and close=q_DailyHigh;  //今低向上拉2.5%以上創今高
condition2= (q_OutSize/q_DailyVolume)>0.6; //外盤量>60%
condition3= q_EstimatedTotalVolume>(q_PreTotalVolume*2) and q_EstimatedTotalVolume>1500; //估量>昨量2倍且>1500張

if time>090300 then begin
   if condition3 then begin
      if condition2 then begin
	     if condition1 then ret=1;
      end;
   end;
end;