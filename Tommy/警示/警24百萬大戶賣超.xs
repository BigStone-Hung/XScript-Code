{@type:sensor|@guid:51a18239e08e4888b393ddbd55e1a2cc}
input:p(200,"大戶門檻(萬元)");
variable:i(0),tv(0),tp1(0),tp(0);
 
i=0;
if date<>date[1] //隔日重新計算
then begin
value1=0;
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
	   if tp>tp1 then value1+=tv;
	   if tp<tp1 then value1-=tv;
	end; 
  end;
end;
 
value2=value1-value1[3];

if value2[1]>0 and value2<0 then ret=1;