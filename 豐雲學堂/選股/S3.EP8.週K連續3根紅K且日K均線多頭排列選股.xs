{@type:filter}
//日K頻率
setbarback(20);//準備足夠的資料

condition1=trueall(getfield("收盤價", "W")>getfield("開盤價", "W"),3);  //周K連3紅
condition2=average(C,5)>average(C,10) and average(C,10)>average(C,20);  //均線多頭排列
condition3=average(V,10)>800;  //10日均量至少800張

if condition1 and condition2 and condition3 then ret=1;



