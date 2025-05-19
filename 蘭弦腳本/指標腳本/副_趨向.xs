{@type:indicator|@guid:79ccaa77144642e481cb21a90ce5069a}
variable: pdi_value(0), ndi_value(0), adx_value(0);
DirectionMovement(13, pdi_value, ndi_value, adx_value);
if CurrentBar < 13 then
 begin
	pdi_value = 0;
	ndi_value = 0;
	adx_value = 0;
 end;
value1=maxlist(pdi_value,ndi_value);
value2=minlist(pdi_value,ndi_value);
value3=value1-value2;
condition1= C>C[1] and VALUE1=highest(value1,8) and value3>value2[1] and value3>value2 and value3[1]<value2[1] and absValue(value2[1]-value3[1])>absValue(value2[2]-value3[2]);
Plot1(value3-value2,"D差I",checkbox:=1);
Plot2(value2, "負DI",checkbox:=1);
Plot3(value3, "DI差",checkbox:=1);
IF condition1 then Plot4(50,"TEST") Else Plot4(0,"TEST");

