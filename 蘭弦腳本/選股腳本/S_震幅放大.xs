{@type:filter|@guid:d1cdb663fa254e8082c65c404ba1bc9f}
SETBarFreq("AD");
SETTOtalBar(14);
VALUE1=H-L;
VALUE2=AVerage(VALUE1[1],4);
CONDITION1=VALUE1>VALUE2*2 and VALUE2[1]<VALUE2[2];
CONDITION2=MAXList(BIAS(5),BIAS(8),BIAS(13))<8 and MINList(BIAS(5),BIAS(8),BIAS(13))>0;
IF C>O and V>100 and CALL_55W>0 and GetField("累計營收年增率", "M")>0 and GetField("本益比", "D")>0 and GetField("本益比", "D")<55
	and CONDITION1 and NOT(CONDITION1[1]) and CONDITION2 THEN RET=1;