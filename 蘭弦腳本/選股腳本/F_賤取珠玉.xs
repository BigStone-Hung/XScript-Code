{@type:filter|@guid:0809f0651a8f4221904326616a390cb9}
SETBARFREQ("AD");
SETTOTALBAR(56);
CONDITION1=Call_RD>3 and Call_RE>0 and Call_55W>0 and trueAny(Call_55W[1]<0,3);
IF CONDITION1 THEN RET=1;
OUTPUTFIELD1(Call_RA,"盈餘報酬率");
OUTPUTFIELD2(Call_RB,"資本報酬率");
OUTPUTFIELD3(Call_RC,"本業成長率");
OUTPUTFIELD5(GetField("本益比", "D"),"本益比");
OUTPUTFIELD6(Call_RD,"殖利率");
OUTPUTFIELD7(1-Call_RE,"淨值比");





