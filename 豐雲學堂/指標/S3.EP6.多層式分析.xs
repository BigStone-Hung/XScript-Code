{@type:indicator|@guid:e5826273e2bb4a2ea4c5f2ba1d7e5bb0}
input:days(20,"天數");
value1 = log(C);

value2 = bollingerBand(value1,days,2);

value3 = bollingerBand(value1,days,-2);

plot1(expValue(value2),"UpperBB");
plot2(expValue(value3),"LowerBB");