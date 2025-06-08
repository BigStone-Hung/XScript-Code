{@type:filter}
setbarFreq("D"); // 設定為日線頻率

// 輸入參數：靈活設置條件門檻
input: MinVolume(1000, "最低成交量（張）"),
       MinAmount(3000, "最低成交金額（萬元）"),
       MinPrice(10, "最低股價（元）"),
       MinRateOfChange(5, "最近 N 日漲幅門檻（%）"),
       LookbackDays(10, "漲幅計算天數"),
       MainForceDays(5, "主力買賣超計算天數");

// 條件 1：流動性條件
condition1 = (getField("成交量", "D") > MinVolume or getField("成交金額(元)", "D") / 10000 >= MinAmount) and c > MinPrice;

// 條件 2：短期漲幅條件
condition2 = rateOfChange(c, LookbackDays) > MinRateOfChange;

// 條件 3：主力買超條件
condition3 = summation(getField("主力買賣超張數", "D"), MainForceDays) > 0;

// 選股條件：當所有條件均滿足時返回選股信號
if condition1 and condition2 and condition3 then ret = 1;

// 輸出結果
outputField(1, getField("成交量", "D"), 0, "今日成交量");
outputField(2, getField("成交金額(元)", "D") / 10000, 2, "今日成交金額（萬元）");
outputField(3, rateOfChange(c, LookbackDays), 2, "最近" + NumToStr(LookbackDays, 0) + "日漲幅（%）");
outputField(4, summation(getField("主力買賣超張數", "D"), MainForceDays), 0, "主力買超（張）");

{
condition1 = (getField("成交量", "D") > 1000 or getField("成交金額(元)", "D") / 10000 >= 3000) and c > 10;
condition2 = rateOfChange(c, 10) > 5;
condition3 = summation(getField("主力買賣超張數", "D"), 5) > 0;

if condition1 and condition2 and condition3 then ret = 1;
}