{@type:sensor|@guid:7da51fecf35d4738b3f97cd6b0abcdfc}
input:tday(20190503,"請輸入特定日期");
value1=getbaroffset(tday);
  
if close> high[value1] then ret=1;