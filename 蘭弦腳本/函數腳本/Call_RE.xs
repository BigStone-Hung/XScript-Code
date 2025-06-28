{@type:function|@guid:c98f43f67c3546ad91d88e1853a07014}
//VALUE1=GetField("稅前息前淨利", "Q")-GetField("營業外收入及支出", "Q");
//VALUE2=(GetField("股東權益總額", "Q")+GetField("股東權益總額", "Q")[1])/2;
//VALUE3=GetField("營運資金","Q")+GetField("固定資產","Q");
//VALUE4=(GetField("稅前息前淨利", "Q")-GetField("營業外收入及支出", "Q")-GetField("稅前息前淨利", "Q")[1]-GetField("營業外收入及支出", "Q")[1])/GetField("稅前息前淨利", "Q")-GetField("營業外收入及支出", "Q");
//VALUE5=(GetField("稅前息前淨利", "Q")-GetField("營業外收入及支出", "Q")-GetField("稅前息前淨利", "Q")-GetField("營業外收入及支出", "Q")[1])/GetField("營業收入淨額", "Q");
//VALUE6=GetField("殖利率", "D");
VALUE7=GetField("股價淨值比", "D");
//CONDITION1=leftstr(symbol,2)<>"28" and leftstr(symbol,2)<>"58" and RIGhtStr(SYmbolName,2)<>"KY";
Call_RE=VALUE7;
//Call_RE=Iff(CONDITION1 and VALUE7>0,VALUE7,0);