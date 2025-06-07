{@type:filter|@guid:7c8bb315e6bf49c8bc5c5edb92f6e97f}
setbarFreq("AM");       //設定頻率為還原月K
array:change[10](0);    //宣告一個陣列change記下過去十年下個月的漲幅
variable:x(0), count(0);//用count記下過去十年有幾次下個月上漲
count = 0;          

for x = 1 to 10
begin
	//1~10年前的下月漲幅
	change[x] = (close[12 * x - 1] - close[12 * x]) / close[12 * x]; 
	if change[x] > 0 then //漲幅為正就讓count + 1
		count = count + 1;
end;

if  count >= 8  //如果過去10年至少有8次上漲
and array_Sum(change, 1, 10) / 10 > 0.03 //且平均漲幅超過3%
and trueall(v[1] > 20000, 5) then //且過去5個月成交量都在20000張以上
	ret = 1; //就選出來做為下月常勝軍

{利用 outputfield 把 count 和平均漲幅及過去十年下月漲幅都印出來}
outputfield(1, count, 0, "符合的次數");
outputfield(2, 100 * array_Sum(change, 1, 10) / 10, "平均漲幅");
outputfield(3, 100 * change[1], 2, "報酬1");
outputfield(4, 100 * change[2], 2, "報酬2");
outputfield(5, 100 * change[3], 2, "報酬3");
outputfield(6, 100 * change[4], 2, "報酬4");
outputfield(7, 100 * change[5], 2, "報酬5");
outputfield(8, 100 * change[6], 2, "報酬6");
outputfield(9, 100 * change[7], 2, "報酬7");
outputfield(10, 100 * change[8], 2, "報酬8");
outputfield(11, 100 * change[9], 2, "報酬9");
outputfield(12, 100 * change[10], 2, "報酬10");
outputfield(13, v[1], 2, "前1月成交量");
outputfield(14, v[2], 2, "前2月成交量");
outputfield(15, v[3], 2, "前3月成交量");
outputfield(16, v[4], 2, "前4月成交量");
outputfield(17, v[5], 2, "前5月成交量");


