{@type:function|@guid:0ec144c1d2aa443ab80f3548f3473722}
//函數腳本
//Open講EP17價格意圖因子%：
{
核心是運用三個重要指標：
1.報酬率：計算股票過去 60 天的總報酬率。
2.變動率：計算過去 60 天每日報酬的絕對值總和，這樣可以衡量股票價格變化的速度。
3.價格意圖因子：報酬率 / 變動率。
這就是所謂的價格意圖因子

這個策略設定了三個篩選條件：
1.收益率上限：過去 60 天的收益率需小於 20%，這樣避免挑選近期漲幅過大的股票，減少追高風險。
2.最低交易量：日成交量需大於 200,000 股，確保有足夠的市場流動性。
3.有基本面數據：必須有營收資料支持，增加投資的可靠性。
}

input: days(Numeric, "價格意圖因子統計日數");
value1 = getField("Close", "AD") / getField("Close", "AD")[days] - 1;
value2 = summation(absValue(getField("Close", "AD") / getField("Close", "AD")[1] - 1), days);
value3 = getField("Volume", "D");
value4 = getField("月營收", "M");
if value1 > 0 and value3 > 100 and value4 > 0 and value2 <> 0 then
    Price_intention_factor = value1 / value2 / value3 * 100;
