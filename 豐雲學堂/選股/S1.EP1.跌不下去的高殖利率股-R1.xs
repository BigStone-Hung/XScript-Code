{@type:filter|@guid:1bfbfae24f5f481691a8f5a81a2a14b6}
// 選股: 高ROE的股票
// 作多, 最大持有期別20
//
input:N(20);
  
condition1 = L = Lowest(L,N);
condition2 = H = Highest(H,N);
  
if average(GetSymbolField("tse.tw","收盤價","D"),5) > average(GetSymbolField("tse.tw","收盤價","D"),20)
//大盤處於多頭市場
then begin
    if condition2
    //股價創區間以來高點
    and TrueAll(Condition1=false,N)
    //這段區間都未破底
    and close<close[N-1]*1.05
    //區間股價漲幅不大
	and getfield("現金股利殖利率", "D") > 5
	and trueall(getfield("法人買賣超張數", "D")>100,2)
	//新增因子條件
    then ret=1;
end;