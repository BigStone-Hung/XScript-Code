{@type:filter|@guid:cedcc93fb2194d4a8d3cdcb1d2ddc927}
{改寫內建腳本}
{
setbarfreq("AD");

input:period(30, "波段天期");

value2=nthhighestbar(1,close,period);//波段高點在第幾根Bar
if GetField("融資餘額張數","D")>average(volume,5)
//融資餘額大於五日均量
and GetField("融資餘額張數","D")[value2]>10000
//融資餘額大於一萬張
and GetField("融資餘額張數","D")[value2]>10000
//最高點時融資餘額也大於一萬張
and close*1.2<=close[value2]//波段跌幅超過兩成
and getfield("融資維持率", "D")<140  //融資維持率低於140%，但是大於110%
and getfield("融資維持率", "D")>110
then ret=1;
}

setbarfreq("AD");
input: period(30, "波段天期");

value2 = nthhighestbar(1, close, period); // 計算波段高點所在 K 棒

if GetField("融資餘額張數", "D") > GetField("融資餘額張數", "D")[value2] // 當前融資餘額未減少
and GetField("融資餘額張數", "D")[value2] > 10000 // 波段高點時融資餘額大於一萬張
and close * 1.2 <= close[value2] // 波段跌幅超過 20%
and getfield("融資維持率", "D") < 140 // 融資維持率低於 140%
and getfield("融資維持率", "D") > 110 // 融資維持率大於 110%
then ret = 1;

// 輸出結果
outputField1(close[value2], "波段高點收盤價");
outputField2(GetField("融資餘額張數", "D")[value2], "波段高點融資餘額");
outputField3(close, "當前收盤價");
outputField4(GetField("融資餘額張數", "D"), "當前融資餘額");
outputField5(GetField("融資維持率", "D"), "當前融資維持率");
