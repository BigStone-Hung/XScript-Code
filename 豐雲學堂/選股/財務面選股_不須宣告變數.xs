{@type:filter|@guid:e72002867021451ea09cb98c71a94ac9}
//財務面選股_不須宣告變數

value1 = highest(getField("月營收", "M")[1], 60);
condition1 = getField("月營收", "M") > value1;
condition2 = trueAll(getField("月營收年增率", "M")>30,3);  //單位%
condition3 = trueAll(getField("稅後淨利成長率", "Q")>10,2);  //單位%
if condition1 and condition2 and condition3 then ret=1;

outputfield(1, getField("月營收年增率", "M"),"月營收年增率");
outputfield(2, getField("稅後淨利成長率", "Q"),"稅後淨利成長率");


