{@type:sensor|@guid:04ace70324654c8ca166f53439484cb4}
//本範例為XQ內建警示腳本，在系統警示腳本搜尋相同名稱即可找到
//用於5分K

{
input:Length(100,"計算期數");
input:Ratio(0.5,"突破幅度%");
input:RRatio(1.5,"盤整區間幅度%");
input:TXT1("僅適用5分鐘線","使用限制");
 
settotalbar(3);
setbarback(Length);
 
if barfreq<> "Min" or barinterval <> 5 then return;
 
variable: RangeHigh(0);
variable: RangeLow(0);
RangeHigh=highest(close[1],length);
RangeLow=lowest(close[1],length);
 
if RangeHigh[1] < RangeLow[1] * (1+ RRatio/100) then begin
	if Close crosses over RangeHigh*(1+Ratio/100)
	and volume>average(volume,length)*1.5
	and trueall(GetField("成交量","D")>500,10)
	and countif(GetField("主力買賣超張數","D")[1]>0,10)>=7
	and GetSymbolField("tse.tw","收盤價","D")>GetSymbolField("tse.tw","收盤價","D")[1]
	and GetSymbolField("tse.tw","收盤價","D")>average(GetSymbolField("tse.tw","收盤價","D"),5)
	then ret=1;
end;
}

//======================== 輸入參數 ========================
input: Length(100, "計算期數"),
       Ratio(0.5, "突破幅度%"),
       RRatio(1.5, "盤整區間幅度%"),
       TXT1("僅適用5分鐘線", "使用限制");

//======================== 基本設定 ========================
settotalbar(3);
setbarback(Length);

// 僅適用於 5 分鐘線
if barfreq <> "Min" or barinterval <> 5 then return;

//======================== 變數定義 ========================
variable: RangeHigh(0), RangeLow(0);

// 計算區間高低值
RangeHigh = Highest(Close[1], Length);
RangeLow = Lowest(Close[1], Length);

//======================== 條件判斷 ========================
if RangeHigh[1] < RangeLow[1] * (1 + RRatio / 100) then // 確認盤整區間
begin
    if Close crosses over RangeHigh * (1 + Ratio / 100) // 價格突破高點
    and Volume > Average(Volume, Length) * 1.5         // 成交量大於平均成交量 1.5 倍
    and trueall(GetField("成交量", "D") > 500, 10)      // 連續 10 日成交量 > 500
    and countif(GetField("主力買賣超張數", "D")[1] > 0, 10) >= 7 // 10 天內 7 天主力買超
    and GetSymbolField("tse.tw", "收盤價", "D") > GetSymbolField("tse.tw", "收盤價", "D")[1] // 大盤上漲
    and GetSymbolField("tse.tw", "收盤價", "D") > Average(GetSymbolField("tse.tw", "收盤價", "D"), 5) // 大盤高於 5 日均價
    then
        ret = 1; // 觸發警示信號
end;
