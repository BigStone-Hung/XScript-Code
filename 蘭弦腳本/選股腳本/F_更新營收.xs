{@type:filter|@guid:5aa5dc942421446699ab4c18fd38ac8a}
input:Sel(0,"寬選0 嚴選1"),days(10,"幾日內更新");
var:i(0);
SetBarFreq("AD"); //僅限日頻率
settotalBar(days+1);
value1 = GETFieldDate("月營收", "M");
if value1 = 0 then return; //過濾沒資料或資料尚未轉檔完畢
for i = days downTo 1
	begin
		if value1<>value1[i] then begin
		value3 = GetField("Date","D")[i-1];
		If sel=0 then 
			begin
				ret=1;
			End
		Else 
			begin
				IF GetField("累計營收年增率", "M")>0 and GetField("月營收月增率", "M") + GetField("月營收年增率", "M")>0 then begin
					If Call_W55>0 then RET=1;
				End;
			End;
	end;
end;


//outputField3(GetField("月營收", "M"),"最新營收(M)");
outputField4(GetField("累計營收年增率", "M"),"累營%");
outputField5(GetField("月營收月增率", "M"),"月增%");
outputField6(GetField("月營收年增率", "M"),"年增%");
outputField7((GetField("月營收月增率", "M")+GetField("月營收年增率", "M"))/2,"合增%");
outputField8(GETFieldDate("月營收", "M"),"月份");
outputField9(value3,"更新日");
