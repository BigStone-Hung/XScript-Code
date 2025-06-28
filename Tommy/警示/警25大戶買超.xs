{@type:sensor|@guid:18d0aaf200774f57bac668e595ac46ba}
input:p(100,"大戶門檻(萬元)");
variable:i(0),tv(0),tp1(0),tp(0);
 
i=0;
if date<>date[1] //隔日重新計算
then begin
value1=0;
value2=0;
end;

if V>0 then begin
  while GetField("時間","Tick")[i]>=time and GetFieldDate("成交量","Tick")[i]=date
  i+=1;
  while i>0 begin
  i-=1;
  tv=GetField("成交量","Tick")[i];
  tp=GetField("收盤價","Tick")[i];
  tp1=GetField("收盤價","Tick")[i+1];
    if 0.1*tv*tp>=p then begin
	   if tp>=tp1 then value1+=tv;
	   if tp<tp1 then value1-=tv;
	end; 
  end;
end;
 
if value1*10>q_DailyVolume then ret=1;