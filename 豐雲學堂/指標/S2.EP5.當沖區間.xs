{@type:indicator|@guid:4b245545803849fba6559a45733b7cb9}
if close > open then
value1=close-open
else value1=open-close;

plot1(value1,"當沖區間");

value2=average(value1,20);
value3=bollingerBand(value1,20,1);

if value1 > value2 and value1 < value3 then
plot2(value2,"適當")
else if value1 > value3 then plot3(value3,"超額");
  
