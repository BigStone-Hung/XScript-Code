{@type:sensor|@guid:1b9126fa187a4dcbad6b0dd1cc951d42}
if getfield("內盤量")<>0 and getfield("外盤量")<>0 then begin
value1=getfield("外盤量")/getfield("內盤量");
end;

if value1>highest(value1[1],3000) then ret=1;
