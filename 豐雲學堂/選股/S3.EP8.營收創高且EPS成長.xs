{@type:filter}
{
進場條件
該程式主要根據以下四個財務條件進行篩選，挑選符合條件的股票：
}


setbarBack(60, "M"); // 回溯最近 60 個月的數據
//條件一、月營收創 60 個月新高：
//判斷是否近期訂單增加，排除營收長期持平或下滑的公司。
condition1 = getField("月營收", "M") = highest(getField("月營收", "M"), 60);

//條件二、連續 3 個月的月營收年增率均大於 30%：
//排除營收異常波動的公司，確保持續穩定成長。
condition2 = trueAll(getField("月營收年增率", "M") > 30, 3);

//條件三、連續 2 季的每股稅後淨利成長率大於 10%：
//確保淨利穩定增長，避免短期業績波動。
condition3 = trueAll(getField("稅後淨利成長率", "Q") > 10, 2);

//條件四、最新的稅後淨利成長率大於上一季的稅後淨利成長率：
//進一步排除季報異常波動的公司，確保最新業績仍處於持續增長中
condition4 = getField("稅後淨利成長率", "Q") > getField("稅後淨利成長率", "Q")[1];
if condition1 and condition2 and condition3 and condition4 then ret = 1;


outputField1(getField("月營收年增率", "M"), "月營收年增率");
outputField2(getField("稅後淨利成長率", "Q"), "稅後淨利成長率-最新");
outputField3(getField("稅後淨利成長率", "Q")[1], "稅後淨利成長率-前一季");

