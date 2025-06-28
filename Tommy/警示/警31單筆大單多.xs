{@type:sensor|@guid:81e17bd230fb495d9346b9036e7cf866}
if currenttime>090300 then begin
   if (GetField("買進特大單金額")-GetField("賣出特大單金額"))>0 
   and close=q_DailyHigh then ret=1;
end;