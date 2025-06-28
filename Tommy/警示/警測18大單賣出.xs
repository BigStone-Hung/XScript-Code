{@type:sensor|@guid:187741cc58bd49679d87c608fbd2b4a1}
if close>200 then begin
   if q_BidAskFlag=-1 then begin
      if q_TickVolume*close>4000 then ret=1;
   end;
end;

if close<200 then begin
   if q_BidAskFlag=-1 then begin
      if q_TickVolume*close>2000 then ret=1;
   end;
end;
