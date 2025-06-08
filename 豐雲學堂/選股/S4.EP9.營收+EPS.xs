{@type:filter|@guid:a613a7c0a6744db1b7ccedfcce4cd9aa}
setbarBack(60,"M");  //準備足夠的資料

//月營收創60個月新高
condition1 = getField("月營收", "M") = highest(getField("月營收", "M"),60);

//連續3個月月營收年增率都大於30% 
condition2 = trueAll(getField("月營收年增率", "M")>30,3);

//連續2季每股稅後淨利(元)增加10% 
condition3 = trueall(getField("稅後淨利成長率", "Q") >10,2);

//最新的稅後淨利成長率大於上一季的稅後淨利成長率
condition4=getField("稅後淨利成長率", "Q")>getField("稅後淨利成長率", "Q")[1];

if condition1 and condition2 and condition3 and condition4 then ret=1;

outputField1(getField("月營收年增率", "M"),"月營收年增率");
outputField2(getField("稅後淨利成長率", "Q"),"稅後淨利成長率-最新");
outputField3(getField("稅後淨利成長率", "Q")[1],"稅後淨利成長率-前一季");

