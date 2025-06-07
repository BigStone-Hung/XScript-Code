{@type:indicator|@guid:1f984de10dae446bb62655d0b8bcce7f}
value1 = getsymbolField("OTC.TW", "close");
value2 = getsymbolField("TPFI.TW", "close");

plot1(value1,"櫃買指數OTC");
plot2(value2,"台幣");