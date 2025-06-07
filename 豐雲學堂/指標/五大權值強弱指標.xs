{@type:indicator}
var: Score(0); //記錄權值分數
array:T5[5,2](0); //T5是個5乘2的二維陣列
Score = 0; 

T5[1,1]=GetSymbolField("2330.tw","close"); //台積電收盤價
T5[1,2]=average(T5[1,1][1],10); //台積電10MA價格
T5[2,1]=GetSymbolField("2454.tw","close"); //聯發科收盤價
T5[2,2]=average(T5[2,1][1],10); //聯發科10MA價格
T5[3,1]=GetSymbolField("2317.tw","close"); //鴻海收盤價
T5[3,2]=average(T5[3,1][1],10); //鴻海10MA價格
T5[4,1]=GetSymbolField("6505.tw","close"); //台塑化收盤價
T5[4,2]=average(T5[4,1][1],10); //台塑化10MA價格
T5[5,1]=GetSymbolField("2412.tw","close"); //中華電收盤價
T5[5,2]=average(T5[5,1][1],10); //中華電10MA價格

if T5[1,1] > T5[1,2] then //台積電收盤價在10MA上
	Score = Score + 10; //分數增加
if T5[2,1] > T5[2,2] then //聯發科收盤價在10MA上
	Score = Score + 8;  //分數增加
if T5[3,1] > T5[3,2] then //鴻海收盤價在10MA上
	Score = Score + 6;  //分數增加
if T5[4,1] > T5[4,2] then //台塑化收盤價在10MA上
	Score = Score + 4;  //分數增加
if T5[5,1] > T5[5,2] then //中華電收盤價在10MA上
	Score = Score + 2;  //分數增加
Score *= 100 / 30;      //把分數調整至100

plot1(Score,"五大權值強弱指標"); //把分數畫出來
plot2(80); //在80那邊畫一條線


