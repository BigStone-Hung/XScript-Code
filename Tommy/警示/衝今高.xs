{@type:sensor|@guid:d3a3c1eec06e4b1d89797a8c1804c89d}
value1=GetField("買進特大單金額");
value2=GetField("買進大單金額");
value3=GetField("賣出特大單金額");
value4=GetField("賣出大單金額");
value5=value1+value2;
value6=value3+value4;

if q_VolumeRatio>1 and q_EstimatedTotalVolume>3000 then begin
   if close<q_DailyHigh and close>q_DailyHigh*0.99 and close>q_DailyLow*1.015 then begin
      if (value5-value6)>0 then ret=1;//單筆>200萬
   end;
end;