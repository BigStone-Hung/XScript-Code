{@type:filter|@guid:3c449189ce50427fa7bbb9c8d72d9502}
VALUE1=average(GetField("投信買賣超")*C*1000,3);
VALUE2=average(GetField("外資買賣超")*C*1000,3);
CONDITION1=VALUE1>VALUE1[1] and VALUE2>VALUE2[1] and GetField("投信買賣超")>0 and GetField("外資買賣超")>0 and C>C[1] and CALL_W55>0;
IF CONDITION1 and not trueAny(condition1[1],5) and CALL_B55>0 and Call_LQ>7 then RET=1;

