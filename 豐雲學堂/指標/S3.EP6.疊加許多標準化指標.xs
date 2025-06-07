{@type:indicator|@guid:4d3039bf86c64745889509fa89a362ac}
variable:
	RSV_(0),K_(0),D_(0),RSI_(0),B(0);
stochastic(9,3,3,RSV_,K_,D_);
RSI_ = RSI(C,6);
B = PercentB(C,30,2,2);

plot1(RSV_,"RSV");
plot2(K_,"K");
plot3(D_,"D");
plot4(RSI_,"RSI");
plot5(B,"%B");