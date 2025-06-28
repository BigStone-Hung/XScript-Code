{@type:sensor|@guid:1cd29ccdf5874de8a6de4438f2206a44}
if volume>highest(volume[1],15) then begin 
value1=high;
value2=low;
end;

if value1<value1[1] then ret=1;