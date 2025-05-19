{@type:filter|@guid:d77093213c624a9bb26a25fbf08194ee}
setbarfreq("AD");
settotalbar(300);
variable:I(0);
Value1=GetField("減資新股上市日");
For i=1 to 255 
	begin
		If Date[I]=Value1 then
			begin
				value2=maxlist(H[I],H[I+1]);
				break;
			End;
	End;
condition1=V>100 and C<value2*1.05;
condition2=highest(H,I)<value2;
If C>O and V>100 and GetField("股本(億)","D")<100 and GetField("股本(億)","D")>3
	and condition1 and condition2 and Call_55W>0 then
RET=1;
outputfield1(VALUE1,"減資新股日");
outputfield3(value2,"基準價");
outputfield2(Round((C-VALUE2)*100/VALUE2,2),"差距%");





