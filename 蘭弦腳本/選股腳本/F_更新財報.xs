{@type:filter|@guid:2a9c5c29f3b44dd2b7c397ebe58931b4}
input:days(1,"幾日內更新");
var:i(0);
SetBarFreq("AD"); //
settotalBar(days+1);
value1 = GETFieldDate("每股稅後淨利(元)", "Q");
if value1 = 0 then return; //過濾沒資料或資料尚未轉檔完畢
for i = days downTo 1
 begin
  if value1<>value1[i] then begin
  value3 = GetField("Date","D")[i-1];
  ret=1;
 end;
end;

//outputField3(GetField("月營收", "M"),"最新營收(M)");
//outputField4(GetField("累計營收年增率", "M"),"累營%");
//outputField5(GetField("月營收月增率", "M"),"月增%");
//outputField6(GetField("月營收年增率", "M"),"年增%");
//outputField7((GetField("月營收月增率", "M")+GetField("月營收年增率", "M"))/2,"合增%");
//outputField8(GETFieldDate("月營收", "M"),"月份");
outputField9(value3,"更新日");