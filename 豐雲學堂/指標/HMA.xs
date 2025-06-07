{@type:indicator|@guid:9fc90899ed4d4bdaab37a2ec237be7c5}


input: Length1(20,"短均"), Length2(60,"長均");
settotalbar(Length2 + 200);

var:MA1(0), HMA1(0), MA2(0), HMA2(0);
 
MA1=2*wma(close,IntPortion(Length1*0.5))-wma(close,Length1);
HMA1=wma(MA1,IntPortion(SquareRoot(Length1)));
 
MA2=2*wma(close,IntPortion(Length2*0.5))-wma(close,Length2);
HMA2=wma(MA2,IntPortion(SquareRoot(Length2)));


Plot1(HMA1,"HMA1");
Plot2(HMA2,"HMA2"); 