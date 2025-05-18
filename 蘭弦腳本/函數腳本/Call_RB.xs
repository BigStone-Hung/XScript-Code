{@type:function}
VALUE1=GetField("稅前息前淨利", "Q")-GetField("營業外收入及支出", "Q");
VALUE3=GetField("營運資金","Q")+GetField("固定資產","Q");
CONDITION1=leftstr(symbol,2)<>"28" and leftstr(symbol,2)<>"58";
Call_RB=Iff(CONDITION1 and VALUE1>0 and VALUE3>0,VALUE1/VALUE3,0);