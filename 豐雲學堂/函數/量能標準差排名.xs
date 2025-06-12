{@type:function|@guid:eb4eb6d1996b42aeb0e1bc86bb2a34c7}

//==================參數定義區==================
var:v1(0),v_avg(0),v_std(0); 
setbarBack(10,"D");
//==================計算區==================
//----------定義標準差----------
if barfreq = "D"  or  barfreq = "Min" then
	 begin
		v_avg = xaverage(getField("成交量", "D")[1],10);//均量
		v_std = standardDev(getField("成交量", "D")[1],10,1);//母體標準差(n-1)
	 end
else if barfreq = "W"  or  barfreq = "M" then
	begin
		v_avg = average(getField("成交量" )[1],10);//均量
		v_std = standardDev(getField("成交量")[1],10,1);//母體標準差(n-1)
	end;

//----------定義量能----------
v1 = v_avg + v_std*3; //極大量=均量+極大標準差倍數

//----------量能結果----------
if v_std<>0 and  v>500 and c>10  and  v > v1 then ret=((V-v_avg)+0.001)/v_std;
