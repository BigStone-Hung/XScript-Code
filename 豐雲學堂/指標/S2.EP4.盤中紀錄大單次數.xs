{@type:indicator|@guid:5c528f1c625642b097de092534000b40}
if barfreq <> "min" then raiseRunTimeError("請運行在分鐘頻率上");

input: atVolume(30,"大單門檻"); //大單條件

settotalBar(600);

variable: intraBarPersist Xtime(0);

if date <> date[1] then Xtime = 0; //每天將計數器歸0

if getField("成交量","Tick") > atVolume // 單筆tick成交量超過大單門檻
     and Getfield("內外盤","Tick") = 1
	 then begin Xtime+=1;
end;
plot1(Xtime,"大單次數");










