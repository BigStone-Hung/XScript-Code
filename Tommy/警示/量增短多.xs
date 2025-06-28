{@type:sensor|@guid:b45cd080adb24394935c207a6c578d81}
if q_VolumeRatio>2 then begin

input:len(3);

value1=summation(volume[1],len);

if volume>value1 or volume>value4 then begin
value2=high;
value3=low;
value4=volume;
end;

if q_PreTotalVolume>300 or q_DailyVolume>300 then begin 
   if volume>50 then begin
     if close crosses above value2 or value2>value2[1] then ret=1;
   end;
end;

end;