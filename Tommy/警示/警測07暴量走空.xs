{@type:sensor|@guid:5f7826516aa9494e9170b0709885dc50}
input:len(3);

value1=summation(volume[1],len);

if volume>value1 or volume>value4 then begin
value2=high;
value3=low;
value4=volume;
end;

if q_VolumeRatio>3 then begin;
   if volume>50 then begin
     if close crosses below value3 or value3<value3[1] then ret=1;
   end;
end;
