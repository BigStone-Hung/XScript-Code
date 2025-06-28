{@type:sensor|@guid:77393e6fa43040ef856e54272369955e}
input:len(3);

value1=summation(volume[1],len);

if volume>value1 or volume>value4 then begin
value2=high;
value3=low;
value4=volume;
end;

if q_VolumeRatio>3 then begin;
   if volume>50 then begin
     if close crosses above value2 or value2>value2[1] then ret=1;
   end;
end;