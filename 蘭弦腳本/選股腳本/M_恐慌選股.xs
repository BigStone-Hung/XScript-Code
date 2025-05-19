{@type:filter|@guid:4d1449556cf6430eb41d9a6ab62a9f28}
SETBarFreq("AD");
SETTOtalBar(35);
IF C>O and C>L[1] and L[1]<L[2] and L[2]<L[5] and lowest(L,3)=lowest(L,21) and highest(V,3)=highest(V,21)
	and GetField("成交金額(元)", "D")>10000000
then RET=1;