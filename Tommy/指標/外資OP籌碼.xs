{@type:indicator|@guid:54714c66a2c942e1b0d0c0208c4202e4}
value1 = GetSymbolField("TXO00.TF","外資買方未平倉口數","D",param := "Call")
         -GetSymbolField("TXO00.TF","外資賣方未平倉口數","D",param := "Call");
value2 = GetSymbolField("TXO00.TF","外資買方未平倉口數","D",param := "Put")
         -GetSymbolField("TXO00.TF","外資賣方未平倉口數","D",param := "Put");

plot1(value1,"外資CAL未平倉");
plot2(value2,"外資PUT未平倉");
plot3(value1-value2,"淨部位");