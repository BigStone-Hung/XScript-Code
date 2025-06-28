{@type:sensor|@guid:55c0d211a09741ce99b1f7494fd02109}
input:V1(2,"漲幅"),
       V2(5,"N日新高"),
	   V3(70,"外盤量佔比%"),
	   V4(2,"成交量/昨量倍數"),
	   V5(1500,"成交張數"),
	   V6(5,"週轉率N%");
	   
value4 = GetQuote("股本(億)");
value5 = value1*10000;
Value6 = GetQuote("漲跌幅");
condition8=(q_DailyVolume/value2*100)>V6;

condition1= q_PriceChangeRatio>V1;  //漲幅>2%
condition2= close=q_DailyHigh;  //股價創今高
condition3= high>highest(highd(1),V2);  //股價創5日新高
condition4= q_DailyVolume>300; //總量>300張
condition5= (q_OutSize/q_DailyVolume)*100>V3; //外盤量>70%
condition6= q_EstimatedTotalVolume>(q_PreTotalVolume*V4); //估量>昨量2倍
condition7= q_EstimatedTotalVolume>V5; //估量>1500張
condition8= value6[1]<>0 and value6[1]<3; //昨日漲幅<3%

if time>090300 and q_DailyVolume<>0 and q_EstimatedTotalVolume<>0 and q_OutSize<>0 then begin
   if condition1 and condition2 and condition3 and condition4 and condition5 and condition6 and condition7 and condition8
   then ret=1;
end;