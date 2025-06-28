{@type:sensor|@guid:a23fb8711e2d407ca585429403020d21}
input:tday(20190510,"請輸入特定日期");
value1=getbaroffset(tday);
  
if close< low[value1] then ret=1;