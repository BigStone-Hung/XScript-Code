{@type:sensor|@guid:4ccb2eddcfda44ceafd603c61aa9617b}
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
if value5=1 then ret=1;