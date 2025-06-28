{@type:sensor|@guid:7ecabb038b474abbb310623481c018f3}
input:len(3);

value1=summation(volume[1],len);

if volume>value1 or volume>value4 then begin
value2=high;
value3=low;
value4=volume;
end;

if close crosses above value2 or value2>value2[1] then ret=1;