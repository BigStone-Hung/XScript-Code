{@type:filter}
//日K頻率
setbarback(10);//準備足夠的資料

condition1=trueall(getfield("投信買賣超", "W")>0,2);  //投信連2周買超
condition2=C>highest(H[1],9);  //股價創10日新高
condition3=average(V,10)>800;   //10日均量至少800張

outputField1(getField("投信買賣超", "W"),0,"投信買賣超");

if condition1 and condition2 and condition3 then ret=1;



