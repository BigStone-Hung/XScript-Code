{@type:sensor|@guid:495fee9566e04d74a57cf17301051d79}
Vars: Str1(""),str2(""),str3(""),str4(""),str5("");
str1=numtostr(close,2);//成交價
str2=numtostr(close-closeD(1),2);//漲跌
str3=numtostr(q_PriceChangeRatio,2);//漲跌幅
str4=numtostr(value1,0);
if date<>date[1] then value1=1;

if q_DailyVolume>1000 or q_PreTotalVolume>1000 then begin
   if volume>100 then begin
   if close=q_DailyHigh and close>close[1] then begin 
   ret=1; value1=value1+1;
   RetMsg = "創今高"+str4+"次" ;
   Print(File("C:\Users\Administrator\Desktop\python\data.txt"), 
   "+"+str4,symbolname,str1,"漲跌 "+str2,"幅度 "+str3+"%","↑股期今高");  
   end;
   end;
end;
