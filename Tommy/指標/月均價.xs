{@type:indicator|@guid:4771e3b043824074b5d51dcc4ce83b3d}
Value1 = Month(date);
if value1<>value1[1] then value2=currentbar;
value3=currentbar-value2+1;
value4=xaverage(close,value3);
value5 = StandardDev(close,value3,2);

plot1(value4,"月均價");
plot2(value4+value5);
plot3(value4-value5);
