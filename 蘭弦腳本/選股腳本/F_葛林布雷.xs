{@type:filter|@guid:8a9a904e81074dba993939ddba8ed129}
SETBARFREQ("AD");
SETTOTALBAR(56);
CONDITION1=summation(GetField("月營收", "M"),3)>summation(GetField("月營收", "M")[3],3);
CONDITION2=Call_55W>0;
IF CONDITION1 and CONDITION2 THEN RET=1;
OUTputField1(ROUND(Call_RA*100,0),"盈餘報酬率");
OUTputField2(ROUND(Call_RB*100,0),"資本報酬率");
OUTputField3(ROUND(Call_RC,0),"本業成長率");
OUTputField4(ROUND(GetField("殖利率", "D"),0),"殖利率");
OUTputField5(ROUND(GetField("本益比", "D"),0),"本益比");
