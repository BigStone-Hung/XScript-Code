{@type:filter|@guid:ba0a35041edc4494a5ce017843052d4f}
//財務面選股_宣告變數

var: highest_revenue(0);
var: revenue_condition(False),
     revenue_YOY_condition(False), 
	 net_income_YOY(False);
	 
input: len1(60, "幾個月最高"),
       YOY_increase(30, "月營收年增率增加%"),
	   YOY_Mon(3, "連續月數"),
	   net_income_YOY_increase(10,"稅後淨利成長率增加%"),
	   net_income_YOY_Mon(2,"連續月數");
	 

// 1) 取得近 60 個月內的最高月營收 (不含當前月，故取 getField(...)[1] 表示前一月資料)
highest_revenue = highest(getField("月營收", "M")[1], len1);

// 2) 檢查是否「當前月營收」>「過去 60 個月最大值」
revenue_condition = ( getField("月營收", "M") > highest_revenue);

// 3) 月營收年增率連續 3 個月都 > 30% 
//    => trueAll( condition, 3 ) 會檢查近 3 筆 (月資料) 是否全為 True
revenue_YOY_condition = trueAll( getField("月營收年增率", "M") > YOY_increase, YOY_Mon);

// 4) 稅後淨利成長率連續 2 季 > 10% 
//    => trueAll( condition, 2 ) 會檢查近 2 筆 (季資料) 是否全為 True
net_income_YOY = trueAll( getField("稅後淨利成長率", "Q") > net_income_YOY_increase, net_income_YOY_Mon);

// 5) 以上 3 個條件同時成立 => ret=1
if revenue_condition 
   and revenue_YOY_condition 
   and net_income_YOY 
then 
    ret = 1;

// 6) 輸出欄位：月營收年增率(%), 稅後淨利成長率(%)
outputfield(1, getField("月營收年增率", "M"), "月營收年增率(單位%)");
outputfield(2, getField("稅後淨利成長率", "Q"), "稅後淨利成長率(單位%)");
