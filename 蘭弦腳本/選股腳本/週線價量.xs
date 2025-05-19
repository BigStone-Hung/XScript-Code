{@type:filter}
SETBarFreq("AW");
SETTOtalBar(22);
VALUE1=AVERage(C,5);
VALUE2=AVERage(C,13);
VALUE3=AVERage(C,21);
CONDITION1=V=HIghest(V,13) and C>H[1] 
	and C>MAXList(VALUE1,VALUE2,VALUE3) 
	and L<MAXList(VALUE1,VALUE2,VALUE3)
	and L[1]<MAXList(VALUE1[1],VALUE2[1],VALUE3[1]);
CONDITION2=VALUE1>VALUE1[1] and VALUE2>VALUE2[1] and VALUE3>VALUE1[3];
IF dayofWeek(DATE)>0 and dayofWeek(DATE)<5 and CONDITION1 and condition2 and not(condition2[1])then begin
	RET=1;
End;