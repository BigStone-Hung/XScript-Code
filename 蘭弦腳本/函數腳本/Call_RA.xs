{@type:function}
VALUE1=GetField("稅前息前淨利", "Q")-GetField("營業外收入及支出", "Q");
VALUE2=(GetField("股東權益總額", "Q")+GetField("股東權益總額", "Q")[1])/2;
CONDITION1=leftstr(symbol,2)<>"28" and leftstr(symbol,2)<>"58" and RIGhtStr(SYmbolName,2)<>"KY";
Call_RA=Iff(CONDITION1 and VALUE1>0 and VALUE2>0 ,VALUE1/VALUE2,0);