{@type:sensor|@guid:0cf476aff07741ad8c96edc114f0b6ca}
Vars: Str1("");
str1=numtostr(close,2);//成交價

value1=GetField("外資持股","日")[1];
value2=GetField("投信持股","日")[1];
value3=GetField("主力持股","日")[1];
value4=value1+value2+value3;
value5=highest(GetField("外資持股","日")[1]+GetField("投信持股","日")[1]+GetField("主力持股","日")[1],5);
condition1=value4>=value5;//籌碼5日新高

value21=GetField("買進特大單金額");
value22=GetField("賣出特大單金額");
value23=GetField("買進大單金額");
value24=GetField("賣出大單金額");
value25=value21+value23-value22-value24;
var:accv(0);
if time=090000 then	accv=0 else accv=accv+value25;
condition2=accv>0;//大戶買賣差>0
condition3=value25>10000000;//大戶買差>1000萬

value31=GetSymbolField("TSE.TW","收盤價","D");
if date<>date[1] then value32=value31[1];
if value32<>0 then value33=(value31-value32)*100/value32;
condition4=q_PriceChangeRatio>value33;//漲幅>大盤

condition5=close>q_AvgPrice;//成交價>當日均價

if condition1 then begin 
   if condition2 then begin
      if condition4 then begin 
	     if condition5 then begin
		    if condition3 and close>q_DailyLow*1.01 then begin
			ret=1;
			//Print(File("C:\Users\Administrator\Desktop\python\data.txt"), 
            //"↑大額買超",symbolname,Str1);
			end;
		 end;
	  end;
   end;
end;