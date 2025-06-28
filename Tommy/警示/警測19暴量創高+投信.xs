{@type:sensor|@guid:ecf2a7094cce47afbb3d2cb35a10c2b3}
value1=GetField("投信持股","日")[1]-GetField("投信持股","日")[6];
if value1>200 then begin

if currenttime>=090400 then begin
if q_EstimatedTotalVolume>1000 then begin//估量>1000張
   if q_VolumeRatio>2 then begin//估量比>3
      once(close=q_DailyHigh) begin //創今高
         ret=1;
      end;
   end;
end;
end;

end;