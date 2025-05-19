{@type:filter|@guid:4aa51bfa91474638afe4643737d70ff2}
setBarFreq("AD");
SetTotalBar(90);
VALUE1=percentr(55)-50;
VALUE2=(bias(21)+bias(34))*2;
VALUE3=(percentr(55)-50)-((bias(21)+bias(34))*2);
condition1=VALUE1[1]<0 and VALUE1[2]>0 and VALUE1>0 and VALUE2[1]>0;
IF C>O and V>V[1] and C>CALL_MP and condition1 then RET=1;
