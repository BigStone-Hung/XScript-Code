{@type:sensor|@guid:3a8813badf144e4b88a69c452665adfc}
if currenttime>=090400 then begin

if q_EstimatedTotalVolume>1000 then begin//估量>1000張
   if q_VolumeRatio>2 then begin//估量比>3
      once(close=q_DailyLow) begin //創今低
         ret=1;
      end;
   end;
end;

end;