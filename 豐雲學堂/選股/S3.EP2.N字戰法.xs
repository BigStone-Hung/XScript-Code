{@type:filter|@guid:690f07242d794751bd0787faf26d4236}
settotalBar(20);
value1=summation(getField("外資買賣超", "D"),3);
condition1=value1>0 and getField("外資買賣超", "D")>0;
condition2=c>10 and v>2000; 
condition3=rateOfChange(c,10)>15;
condition4=h=lowest(h,3) and c<o;
if trueany(condition1 and condition2 and condition3 and condition4,5)
then ret=1;
