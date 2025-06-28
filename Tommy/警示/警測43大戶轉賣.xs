{@type:sensor|@guid:27267948afaf4ce4afa9f507101d86ee}
if date<>date[1]
then begin
value1=currentBar;
end;
value2=DiffBidAskVolumeLxL;

if value2[1]>0 and value2<0 then ret=1;
