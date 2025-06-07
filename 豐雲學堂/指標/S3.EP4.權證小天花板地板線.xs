{@type:indicator|@guid:33f517313fb148f0b1ad412288b0c711}
settotalBar(1500);

value1=bias(20); //看您所需的均線期數作修改
value2= (1+NTHHighest(8, value1, 500)*0.01)*average(c,20); //過去2年的次高乖離率
value3= (1+NTHLowest(8, value1, 500)*0.01)*average(c,20); //過去2年的次低乖離率


Plot1(average(c,20), "月線");
Plot2(value2,"天花板");
Plot3(value3,"地板");