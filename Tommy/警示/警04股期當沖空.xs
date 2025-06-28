{@type:sensor|@guid:b110200218a641ebaf07273c7fef997f}
Vars: Str1(""),str2(""),str3("");
str1=numtostr(close,2);//成交價
str2=numtostr(close-closeD(1),2);//漲跌
str3=numtostr(q_PriceChangeRatio,2);//漲跌幅

input:len(3);

value1=summation(volume[1],len);

if volume>value1 or volume>value4 then begin
value2=high;
value3=low;
value4=volume;
end;

if q_PreTotalVolume>500 or q_DailyVolume>500 then begin 
   if volume>50 then begin
      if close crosses below value3 or value3<value3[1] then begin
	  ret=1;
	  Print(File("C:\Users\Administrator\Desktop\python\data.txt"), 
      "↘",symbolname,str1,"漲跌 "+str2,"幅度 "+str3+"%");
	  end;
   end;
end;