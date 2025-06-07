{@type:indicator|@guid:d5326f0690bb48f4bb2bc18c0077532f}
// 若日期 < 2020/01/02，則不執行 (直接return)
if date < 20200102 then 
    return;

// ==============================
//  1. 選定 2020/1/2 為參考日期
// ==============================
if date = 20200102 then
begin
    value10 = GetSymbolField("TSE.TW", "Open"); // 讀取大盤該日開盤價
    value11 = open;                              // 讀取當前商品(圖中標的)的開盤價
end;

// ==============================
//  2. 大盤基準化
// ==============================
//  依照大盤 "2020/1/2" 的開盤價 value10 為基準，
//  將大盤的(開高低收)除以該基準 => 得到大盤基期走勢

value1 = GetSymbolField("TSE.TW", "Open")  / value10; 
value2 = GetSymbolField("TSE.TW", "High")  / value10;
value3 = GetSymbolField("TSE.TW", "Low")   / value10;
value4 = GetSymbolField("TSE.TW", "Close") / value10;

// 以 PlotK(繪K線) 方式，畫在圖層1 (第一組K線)
// PlotK( groupID, open, high, low, close )
PlotK(1, value1, value2, value3, value4,"TSE");


// ==============================
//  3. 本商品基準化
// ==============================
//  依照"2020/1/2" 當前商品的開盤價 value11 為基準
//  將本商品(開高低收) 做同樣的比例化
value5 = open  / value11;
value6 = high  / value11;
value7 = low   / value11;
value8 = close / value11;

// 畫在圖層2 (第二組K線)
// 以 PlotK(2, 開,高,低,收) 方式顯示
PlotK(2, value5, value6, value7, value8,"對應商品");