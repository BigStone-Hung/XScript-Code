{@type:indicator|@guid:b832755d6f054ce8ac3f88fd1e3be5e2}
settotalbar(900);

value1=GetField("買進特大單金額");
value2=GetField("買進大單金額");
value3=GetField("賣出特大單金額");
value4=GetField("賣出大單金額");
value5=value1+value2;
value6=value3+value4;

value7=summation((value5-value6),10);
value8=value5-value6;

if value8>0 then begin value9=high; value10=low; end;
if value8<0 then begin value11=high; value12=low; end;

if value10>value9[1] then plot1(close);

