{@type:filter|@guid:ad3d1611ca7e4fe6ba2a32e86e80d87a}
setbarfreq("AD");
SetTotalBar(89);
VALUE1=(highest(H[21],34)-lowest(L[21],34))/((highest(H[21],34)+lowest(L[21],34))/2);
value2=((highest(H,55)+lowest(L,55))/2);
Condition1= VALUE1<0.1 ;
Condition2=lowest(L,21)=lowest(L,55) and value2=lowest(value2,21) ;
value11=GetField("主力買張");
value12=(o+h+l+c)/4;
value13=value11*value12;//做多金額 
if summation(value11,34)<>0 then value14=summation(value13,34)/summation(value11,34);
condition1=	H>H[1] and condition1 and condition2 and (C>value14 or value14>value14[1]) and C[1]<value2 and C>value2;
If C>O and V>100 and GetField("股本(億)","D")<100 and GetField("股本(億)","D")>3
	and C>C[1] and trueany(condition1,5) 
then RET=1 ;