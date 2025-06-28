{@type:sensor|@guid:5a8d4508bfe8400f95271a9fdef90f18}
if currenttime>090300 then begin
   if (GetField("買進特大單金額")-GetField("賣出特大單金額"))<0
   and close=q_DailyLow then ret=1;
end;