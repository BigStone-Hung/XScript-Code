{@type:filter|@guid:af78983f252a4729a4472406b5828232}
input: style("混合型");
//可以輸入公司風格變數 //公司風格：成長型、混合型、價值型

input: CapCategory("大型股");
//可以輸入公司類別變數 //公司類別：大型股、中型股、小型股

input:k(0.66,"PEG門檻值");

if GetField("eps","Y") > 0 and GetField("eps","Y")[1] > 0 and GetField("eps","Y")[2] > 0 and GetField("eps","Y")[3] > 0 then begin
value1 = GetField("本益比","D");
value2 = (((GetField("eps","Y") / GetField("eps","Y")[1] - 1) + (GetField("eps","Y")[1] / GetField("eps","Y")[2] - 1) + (GetField("eps","Y")[2] / GetField("eps","Y")[3] - 1)) / 3) * 100;

value3 = value1 / value2;

var:t1(""), t2("");
t1 = GetField("公司風格","Q");
t2 = GetField("公司類別","M");

if value3 < k
and value1 > 0
and value2 > 0
and t1 = style
and t2 = CapCategory

then ret = 1;

end;

