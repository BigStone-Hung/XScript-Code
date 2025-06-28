{@type:sensor|@guid:4f26c84eb9c84f2092ff455f3770fb71}
input:len(3);

value1=summation(volume[1],len);

if volume>value1 or volume>value4 then begin
value2=high;
value3=low;
value4=volume;
end;

if q_PreTotalVolume>1000 or q_DailyVolume>500 then begin 
   if volume>50 then begin
      if close crosses below value3 or value3<value3[1] then begin
	  ret=1;
      end;
   end;
end;