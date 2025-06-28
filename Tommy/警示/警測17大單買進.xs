{@type:sensor|@guid:02c0320235884850a5ea35bbf59e6b6e}
if close>200 then begin
   if q_BidAskFlag=1 then begin
      if q_TickVolume*close>4000 then ret=1;
   end;
end;

if close<200 then begin
   if q_BidAskFlag=1 then begin
      if q_TickVolume*close>2000 then ret=1;
   end;
end;