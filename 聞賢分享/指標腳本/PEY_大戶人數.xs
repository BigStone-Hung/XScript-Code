{@type:indicator|@guid:97f0b27a56da413abf41477255d0d832}
settotalBar(900);
value2=getField("大戶持股人數", param := 400);

plot1(value2,"大戶持股人數");
plot2(average(value2,5),"大戶持股人數");