{@type:sensor|@guid:dde99ca748ea475db2820bc63d3846d6}
variable:i(0),tv(0),tp(0); //設定變數
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
        tv=GetField("成交量","Tick")[i]; //抓出每筆成交量
        tp=GetField("收盤價","Tick")[i]; //抓出每筆成交價
        value1+=tv; //成交量累加
		value2+=tp*tv; //成交量X成交量累加
        end;
   end;
if value2<>0 then //為了避免程式錯誤，不等於0時才計算
value3=value2/value1; //算出均價value3

inputs:T1(090000,"timestart"),V1(300,"day-1 Volume"),V2(100,"day Volume"),V3(20,"K volume"),
       P1(50,"price >"),P2(300,"price <");
if currenttime>T1 then begin
if GetField("成交量","D")[1]>V1 then begin//昨日口數>300口
   if close>P1 and close<P2 then begin//股價50-300
      if GetField("成交量","D")>V2 then begin//日成交量>100口
	     if close>value3 then begin//股價>日均價
		    if close>average(close,34) and close>average(close,55) and close>average(close,68) then begin
		       if rsi(close,12)>50 and rsi(close,15)>50 then begin
		       if volume>V3 then ret=1;
		       end;
		    end;
		 end;
      end;
   end;
end;
end;
		 