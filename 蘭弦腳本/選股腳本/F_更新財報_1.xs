{@type:filter|@guid:7ec27354b44745a1a0979f1873a027c7}
input:N(1,"幾日內更新");
var:i(0);
SetBarFreq("AD"); //
settotalBar(N+1);
value1 = GETFieldDate("每股稅後淨利(元)", "Q");//財報擇一代表科目抓更新的日期
if value1 = 0 then return; //過濾沒資料或資料尚未轉檔完畢
for i = N downTo 1 //抓最近N天 舊到新的倒數的迴圈
	begin
		if value1<>value1[i] then begin
		value3 = GetField("Date","D")[i-1];
		ret=1;
	end;
end;
outputField1(value3,"更新日");
outputField2(GETFieldDate("月營收", "M"),"月份");
outputField5(GetField("月營收月增率", "M"),"月增%");
outputField6(GetField("月營收年增率", "M"),"年增%");
outputField7(GetField("累計營收年增率", "M"),"累營%");
