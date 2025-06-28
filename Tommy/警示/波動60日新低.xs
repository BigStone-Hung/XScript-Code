{@type:sensor|@guid:36e89ce393dc4e3a82acdaad6f9e09d4}
value1=high-low;

if value1<lowest(value1[1],60) then ret=1;