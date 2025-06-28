{@type:sensor|@guid:38b038a889994b36880a2f6a4ca84168}
input:len(3);

value1=summation(volume[1],len);

if volume>value1 or volume>value4 then begin
value2=high;
value3=low;
value4=volume;
end;

if q_EstimatedTotalVolume>(q_PreTotalVolume) and volume>100 then begin
if close crosses above value2 or value2>value2[1] then ret=1;
end;
