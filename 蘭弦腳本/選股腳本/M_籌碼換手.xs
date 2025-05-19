{@type:filter|@guid:f3bedce7e3104ded940518755b0dcb17}
setBarFreq("AD");
SETTOtalBar(56);
VALUE1=average(GetField("投信買賣超")*C*1000,3)+average(GetField("外資買賣超")*C*1000,3);
CONDITION1=VALUE1=Highest(VALUE1,21);
CONDITION2=GetField("融資餘額張數")=lowest(GetField("融資餘額張數"),55) ;
CONDITION9=C>(H+L)/2 and Call_55W[1]>0 and VALUE1>0 and GetField("融資餘額張數")>0;
IF (CONDITION1 or CONDITION2) and trueAny(CONDITION1[1],3) and trueAny(CONDITION2[1],3) 
	and CONDITION9 then RET=1;

