{@type:sensor|@guid:3525571e5e70422c8017f918cca869c0}
input:V1(1000,"當日估量下限"),V2(60,"大量區間");
Value1 = GetQuote("估計量");

Value2 = highest(volume[1],V2);
//V2[60]天內最大量

value3 = GetField("量比");

Vars: Str1(""),str2(""),str3(""),str4(""),str5(""),str6("");
str1=numtostr(close,2);//成交價
str2=numtostr(close-q_RefPrice,2);//漲跌
str3=numtostr(q_PriceChangeRatio,2);//漲跌幅
str4=numtostr(q_VolumeRatio,2);
str5=numtostr(value3,2);

if value1>V1 then begin
   once(value1>value2) begin 
   ret=1;
   RetMsg = "估量比"+str5 ;
   //Print(File("C:\Users\Administrator\Desktop\python\data.txt"), 
   //"暴量"+str4+"倍",symbol,symbolname,str1,"漲跌 "+str2,"幅度 "+str3+"%");
   end;
end;
