{@type:sensor|@guid:2c8ee6fe05e0463dbd81d6dfcaf4fd6c}
Value1 = highest(high,5);  //5日最高價
value2 = GetQuote("估計量"); //當日估量

condition1=value2>volume[1]*2 or value2>volume[2]*2;
//估量為昨量2倍或前日量2倍

condition2=close<value1*0.95;
//股價自5日高點下跌5%

if condition1 and condition2 then ret=1;
