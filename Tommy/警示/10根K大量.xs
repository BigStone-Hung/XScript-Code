{@type:sensor|@guid:d6f28094e6714c5da675c086fadaa210}
if volume>highest(volume[1],15) then begin 
value1=high;
value2=low;
end;

if value1>value1[1] then ret=1;