{@type:sensor|@guid:e0e8597be27143ab881d5c9ae196300c}
input:tday1(20200130,"日期1"),tday2(20200224,"日期2");
value1=getbaroffset(tday1);
value2=getbaroffset(tday2);

if low>high[value1] and close>high[value2] then ret=1;