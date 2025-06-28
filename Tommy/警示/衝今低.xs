{@type:sensor|@guid:db3bc16b4640429f85145594ee15aa78}
value1=GetField("買進特大單金額");
value2=GetField("買進大單金額");
value3=GetField("賣出特大單金額");
value4=GetField("賣出大單金額");
value5=value1+value2;
value6=value3+value4;

if q_VolumeRatio>1 and q_EstimatedTotalVolume>3000 then begin
   if close>q_DailyLow and close<q_DailyLow*1.01 and close<q_DailyHigh*0.985 then begin
      if (value5-value6)<0 then ret=1;//單筆>200萬
   end;
end;