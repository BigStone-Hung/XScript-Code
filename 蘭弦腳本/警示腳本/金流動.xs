{@type:sensor|@guid:60d30f612b6740599054dc8a3d3dd24a}
value1=GetField("資金流向")[1];
value2=average(value1,21);
value3=value1-value2;
value4=average(value3,5);
value5=average(value3,8);
CONDITION1=VALUE1>VALUE2 AND VALUE1[1]<VALUE2[1] and Call_55W>0;
CONDITION2=V>Call_BV[1] and Call_BV>Call_BV[1] and C>O and O>MAXList(O[1],C[1]);
IF CONDITION1 and CONDITION2 THEN RET=1;

