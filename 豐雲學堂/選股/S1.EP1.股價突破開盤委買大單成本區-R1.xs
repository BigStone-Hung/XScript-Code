{@type:filter|@guid:eda40f7921274ea980c804a490ee674d}
// 做多, 停利:7%, 停損:5%, 最大持有5期
input: runmode(1, "執行模式: 0(警示) 1(回測)");
if runmode = 1 then
begin
    // 回測
    value1=GetField("開盤委買","D");
    value2=GetField("開盤委賣","D");
    value3=value1-value2;
 
    if GetSymbolField("tse.tw","收盤價","D") > average(GetSymbolField("tse.tw","收盤價","D"),10)
    //大盤處於多頭格局
    then begin
      //開盤委買張數減去開盤委賣張數
      if trueall(value3[1]<150,5)
      //過去五天差距都小於150張
      and value3>=300
      //今天差距超過300張
      and close[1]<close[4]*1.07
      //股價比三天前漲幅不到7%
      and close > close[1]
	  //新增因子條件
	  and average(close,10) > average(close,60)
	  and value2 < 50
      then ret=1;
    end;
end;
