{@type:sensor|@guid:1cbd280cced74de1a34973e47291c43c}
input:len(3);

value1=summation(volume[1],len);

if volume>value1 or volume>value4 then begin
value2=high;
value3=low;
value4=volume;
end;

if q_PreTotalVolume>1000 or q_DailyVolume>500 then begin 
   if volume>50 then begin
     if close crosses above value2 or value2>value2[1] then begin
	 ret=1;
	 end;
   end;
end;