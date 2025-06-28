{@type:function|@guid:b946dfb73a8e415494bf8c2ca7f9050c}
VALUE4=(GetField("稅前息前淨利", "Q")-GetField("營業外收入及支出", "Q")-GetField("稅前息前淨利", "Q")[1]-GetField("營業外收入及支出", "Q")[1])/GetField("稅前息前淨利", "Q")-GetField("營業外收入及支出", "Q");
VALUE5=(GetField("稅前息前淨利", "Q")-GetField("營業外收入及支出", "Q")-GetField("稅前息前淨利", "Q")-GetField("營業外收入及支出", "Q")[1])/GetField("營業收入淨額", "Q");
CONDITION1=leftstr(symbol,2)<>"28" and leftstr(symbol,2)<>"58";
Call_RC=Iff(CONDITION1 and VALUE4>0 and VALUE5>0,VALUE4/VALUE5,0);