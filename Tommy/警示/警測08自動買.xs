{@type:sensor|@guid:5d72090f9a6f47688466e5e09f2eb7a0}
input:t(084500,"開啟時間");

if currenttime>t then begin
if q_DailyVolume>300 and volume>50 then begin
   if close<100 and close=q_DailyHigh then begin 
   ret=1;
   end;
end;
end;
