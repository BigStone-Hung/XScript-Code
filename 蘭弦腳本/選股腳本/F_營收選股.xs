{@type:filter|@guid:dc34e764832c4741ae6028c16bf69d59}
setbarfreq("M");
settotalbar(34);
//======================================================
value10=GetField("月營收","M");
value11=Round(GetField("月營收月增率", "M"),0);
value12=Round(GetField("月營收年增率","M"),0);
value13=Round(GetField("累計營收年增率","M"),0);
value14=(value11+value12+value13)/3;
//==========================================
condition1=((value11+value12)/2)>value13 and summation(value10,3)>summation(value10[3],3);
condition11=value11>10 and value12>8 and value13>13 and value4<34;	
//=================================================
condition21= VALUE11>0 and VALUE13>10 and VALUE13[1]>0 
	and VALUE13>VALUE13[12] and value13>VALUE13[1]
	and (VALUE12[2]<0 or VALUE12[3]<0 or VALUE12[4]<0) ;
//=========================================================================================
condition31= average(value10[5],8)<average(value10[7],8) 
	and value10>value10[1] and value10>average(value10[1],3) 
	and value12>0 and value13>10 and value13<50;
//=========================================================================================
condition41=value10=highest(value10,15)	and countIf(value10[1]=highest(value10[1],15),5)<2 and value13>13;
//==========================================================================
value51=average(value10,3);
value52=average(value10,15);
condition51=value51>value52 AND value51[1]<value52[1]
	and value13>8 and value13<50;
//=========================================================================
value61=average(value10,20);
value62=bollingerBand(GetField("月營收","M"),20,1.5);
value63=bollingerBand(GetField("月營收","M"),20,-1.5);
condition61=value10>value62 AND countIf(value10[1]>value62[1],5)<3
			AND value10>value10[1] AND value62[0]>value62[1] 
			AND value11>8 AND value12>8 AND value13>0;
//=============================================	
IF condition1
	and (condition11 or condition21	or condition31 or condition41 or condition51 or condition61)
	and GetField("本益比", "D")>5 and GetField("本益比", "D")<34
then ret=1;	
//======================================================================
outputField1(GetField("成交金額(元)", "D"),"成交額");
outputfield2(value11,"月%");
outputfield3(value12,"同%");
outputfield4(value13,"累%");
outputfield5(GetField("本益比", "D"),"PE");
outputfield6("https://histock.tw/stock/financial.aspx?no=" + leftStr(symbol,4),"累%");
