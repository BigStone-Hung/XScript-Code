{@type:indicator|@guid:57f765a15c35444296d182fefc975172}
value1=GetSymbolField("FITX*1.TF","收盤價");
value2=value1-GetSymbolField("FITX*1.TF","開盤價","D");
plot1(value1,"台指");
plot2(value2,"漲跌");