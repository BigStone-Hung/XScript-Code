{@type:sensor|@guid:ba044c4dbf8a4ff6bf7b254c6d1fd5df}
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
      if close crosses below value3 or value3<value3[1] then ret=1;
   end;
end;
end;