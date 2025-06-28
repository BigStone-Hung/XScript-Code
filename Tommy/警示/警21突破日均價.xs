{@type:sensor|@guid:839c57a83e1244e7892b77edeaa39f68}
variable:i(0),tv(0),tp(0);
 
i=0;
if date<>date[1]
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
        value1+=tv;
		value2+=tp*tv;
        end;
   end;
if value2<>0 then 
value3=value2/value1;//以上算出日成交均價

//警示條件：1.日均價上揚 2.成交量>前3根K累積 3.K棒收紅
if q_PreTotalVolume>3000 or q_EstimatedTotalVolume>q_PreTotalVolume*1.5 then begin
if value3>value3[3] and volume>summation(volume,3)[1] and close>open
then ret=1;
end;