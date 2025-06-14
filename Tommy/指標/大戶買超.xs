{@type:indicator|@guid:427695e54b8e4d47983961437f7ae9e7}
input:p(100,"大戶門檻(萬元)");
variable:i(0),tv(0),tp1(0),tp(0);

// i = tick迴圈索引
// tv = tick的成交量
// tp = tick的當筆成交價
// tp1= tick的下一筆成交價 (用來判斷漲跌)
// p = 大戶門檻(預設100萬，單位為"萬元"表示乘以0.1)

//----------------------------------------------
// 1. 基本初始化
//----------------------------------------------
i=0;

// 若「當前Bar日期 != 前一Bar日期」(換日時)，清空累計
if date<>date[1] then 
begin
    value1=0; 
    value2=0;
end;

//----------------------------------------------
// 2. 若當前Volume>0，才進行逐筆掃描
//----------------------------------------------
if V>0 then 
begin
    // (A) 先往下找「i」：條件是「該筆tick時間 >= 當前Time」且 tick日期=當前日期
    //   -> 用來鎖定起始Tick的位置
    while GetField("時間","Tick")[i] >= time 
          and  GetFieldDate("成交量","Tick")[i] = date
        i += 1; 
        // 不斷增加 i, 表示往後檢查tick

    // (B) 再由該位置開始往回(倒序)掃描tick
    while i>0 
    begin
        i -= 1;
        tv = GetField("成交量","Tick")[i];    // 取第 i 筆的 tick 成交量
        tp = GetField("收盤價","Tick")[i];    // 取第 i 筆的當筆成交價
        tp1= GetField("收盤價","Tick")[i+1];  // 取第 i+1 筆的成交價(較新的成交)

        // (C) 若此筆成交金額(0.1 * tv * tp) >= p，表示大單(超過門檻)
        //     注意: "0.1" 代表將「tv*tp」(張數*價格)轉換成萬元，與 p 比較
        if (0.1 * tv * tp) >= p then
        begin
            // (D) 判斷當筆價格(tp) 與下一筆(tp1)大小
            //     若 tp >= tp1 => 視為買超 => value1 += tv
            //     若 tp <  tp1 => 視為賣超 => value1 -= tv
            if tp >= tp1 then 
                value1 += tv
            else if tp < tp1 then 
                value1 -= tv;
        end; 
    end;
end;

//----------------------------------------------
// 3. 繪製指標: 「大戶買賣超」的差分
//----------------------------------------------
// 這裡 plot1(...) 的數值是 (value1 - value1[2])，可視為 "跟前2 Bar相比的變化量"
// 或是短期增減。
plot1(value1-value1[2],"大戶買賣超");
