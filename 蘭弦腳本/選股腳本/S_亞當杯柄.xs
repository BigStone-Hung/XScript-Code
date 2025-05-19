{@type:filter|@guid:9340e12fee584dc1a3f9ade26334db23}
input:D1(200),D2(55);
setbarfreq("AD");
settotalbar(D1+1);
//setbackbar(1);
variable:I(0),J(0),D(0),PR55(0),V_L(65535),avgv21(0);
if currentbar<D1-D2
then begin
	if H>value1 
	then begin
		value1=H;
		value2=currentbar;
	end;
end
else begin
	if H>value3
	then begin
		value3=H;
		value4=currentbar;
		value5=(value3-value1)/(value4-value2);
	end;
	if L<V_L then V_L=L;
	value6=value3+(currentbar-value4)*value5;
end;
if J<21 then J+=1 else avgv21-=V[21];
avgv21+=V;
if not islastbar then return;
value7=value3-V_L;
if value7<>0 then PR55=100*(value3-C)/value7 else PR55=0;
Condition1=L>maxlist(O[1],C[1]);
Condition2=C*1.05>value6 and O<value6 and lowest(L,55)>lowest(L,89)	and value5<0 and V>avgv21/J ; 
if C>O //and GetField("股本(億)","D")<100 and GetField("股本(億)","D")>3 and V>50 
	and trueany(condition1,5) and trueany(condition2,5)	and C>(H+L)/2 and PR55>0
	and (V<Call_BV*2 or H<highest(H[1],55)) and percentr(55)-50>0 and C<C[1]*1.09 then begin
		ret=1;
End;
outputfield1(avgv21,"?");
outputfield2(V_L,"?");
outputfield3(value6,"?");





