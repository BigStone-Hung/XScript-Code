{@type:sensor|@guid:310b8947c7474d3ba3a5d8fd397a6d98}
if date<>date[1]
then begin
value1=currentBar;
end;
value2=DiffBidAskVolumeLxL;

if value2[1]<0 and value2>0 then ret=1;
