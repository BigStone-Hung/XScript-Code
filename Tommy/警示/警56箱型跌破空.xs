{@type:sensor|@guid:3d96786d6fe24734ae4d249b6beb2e02}
inputs:period(20),change(10);

value1=highest(high[1],period);
value2=lowest(low[1],period);
value3=((value1/value2)-1)*100;

if value3<change then begin
   if close<value2 then ret=1;
   end;