{@type:function|@guid:3afe248f72ba4d02adf80d401a24da4f}
// 函數腳本：計算投本比 (%) = 投信買超張數 / 發行張數 * 100

Input: days(Numeric, "投本比統計天數");
Var: issueShares(0), netBuy(0);

// 取得發行張數與指定天數內的投信買賣超累積值
issueShares = getField("發行張數(張)");
netBuy = Summation(getField("投信買賣超"), days);

// 若發行張數不為 0，則計算投本比
If issueShares <> 0 Then
    TouBenRatio = netBuy / issueShares * 100;
