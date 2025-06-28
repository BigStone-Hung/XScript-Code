{@type:sensor|@guid:2c6ee201a58d433d8d48f1f258cf7dfa}
input:L1(20);
if close>highest(High[1],L1) then begin
ret=1;
end;