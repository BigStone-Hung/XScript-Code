{@type:sensor|@guid:225fa76d74594570a88dcce142f12a2f}
input:L1(20);
if close<lowest(low[1],L1) then begin
ret=1;
end;