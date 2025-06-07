{@type:indicator|@guid:b0043b4fa2984edeb2616a9031894c45}
input:
	RSV_(9),K_(3),D_(3),RSI_(6);
	
stochastic(RSV_,K_,D_,value1,value2,value3);

value4 = rsi(getField("avgprice"),RSI_);

plot1(value1,"RSV");
plot2(value2,"K");
plot3(value3,"D");
plot4(value4,"RSI");

setplotLabel(1,"RSV - "+numtoStr(RSV_,0));
setplotLabel(2,"K - "+numtoStr(RSV_,0)+","+numtoStr(K_,0));
setplotLabel(3,"D - "+numtoStr(RSV_,0)+","+numtoStr(K_,0)+","+numtoStr(D_,0));
