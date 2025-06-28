{@type:sensor|@guid:0ced34ea1a244db99a48d24c9a36a6a8}

if close<110 and close>45 then begin
if trueall(close>open,3) then begin
if trueall((volume>volume[1]),3) then begin
if close<close[3]*1.05 then ret=1;
end;
end;
end;