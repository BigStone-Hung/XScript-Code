{@type:sensor|@guid:9fab72e160804f149ffede1f4d3090a7}
Vars: Str1(""),str2(""),str3(""),str4(""),str5("");
str1=numtostr(close,2);//成交價
str2=numtostr(close-q_RefPrice,2);//漲跌
str3=numtostr(q_PriceChangeRatio,2);//漲跌幅
str4=numtostr(q_EstimatedTotalVolume,0);//預估量
str5=numtostr(q_PreTotalVolume,0);//昨量

//多訊條件
condition1=volume>volume[1] and volume>300 and close>highest(High[1],3);
if condition1 then begin 
      value1=highest(High[1],3);
      value2=low;
	  value3=1;
   end;
condition2=close crosses below value2;

//統計多訊次數
if condition2 then begin
   value4=CurrentBar;
end;
value5=countif(condition1,currentbar-value4);

//選股多訊1次以上
if value5[1]=1 and value5=2 then begin
ret=1;
//Print(File("C:\Users\Administrator\Desktop\python\data.txt"), 
//"多訊2↑",symbol,symbolname,str1,"漲跌 "+str2,"幅度 "+str3+"%");
end;