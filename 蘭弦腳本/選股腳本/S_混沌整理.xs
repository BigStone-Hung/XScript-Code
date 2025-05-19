{@type:filter|@guid:ce8e42ce3e54409c8978e2737b98e2b3}
setbarfreq("AD");
settotalbar(55);
value1=percentr(55)-50;
condition1= O<minlist(O[1],C[1])*0.99 and C<=O;
If H[2]>value7 then
	value71=0;
If L[2]<value8 then
	value71=1;
If high[2] = highest(high,5) and (value71=0 or H>value7) and H<H[2] then
Begin	
	value777=value77;
	value77=value7;
    value7 = high[2];
    value71=1;
	value543=value543+1;
End;
If L[2] = lowest(L,5) and (value71=1 or L<value8) and L>L[2] then
Begin
	value888=value88;
  	value88=value8;
    value8=low[2];
    value71=0;
	value543=0;	
End;
If C>O and V>100 and GetField("股本(億)","D")<100 and GetField("股本(億)","D")>3
	and value7<=value77 and value77<=value777 
	and value8>=value88 and value88>=value888
	and C>value8 and C<value7 
then ret=1;
//================================
outputfield(1,value8,"A");
outputfield(2,value88,"B");
outputfield(3,value888,"C");
//outputfield(4,value8,"新低");
//outputfield(5,value88,"前低");


