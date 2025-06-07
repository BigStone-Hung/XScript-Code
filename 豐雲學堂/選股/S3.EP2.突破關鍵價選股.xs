{@type:filter|@guid:e78b92c25d624e3cb864969aa077540a}
condition1=(getField("成交量", "D")>1000 or getField("成交金額(元)", "D")/10000>=3000) and c>10; //流動性
condition2=rateOfChange(c,10)>5;
condition3=summation(getField("主力買賣超張數", "D"),5)>0 and getField("主力買賣超張數", "D")>0 ;
if condition1 and condition2 and condition3 then ret=1;

