{@type:filter|@guid:458164f92dbf4b58b656ba687b414b99}
setBarFreq("Q");
input:Sel(1);
condition1=GetField("累計營收年增率", "M")>0 and summation(GetField("月營收", "M"),3)*100>GetField("營業收入淨額", "Q")*0.95 ;
condition2=(GetField("平均收帳天數", "Q")+GetField("平均售貨天數", "Q")<GetField("平均收帳天數", "Q")[4]+GetField("平均售貨天數", "Q")[4] 
	and GetField("平均收帳天數", "Q")[4]+GetField("平均售貨天數", "Q")[4]-GetField("平均收帳天數", "Q")-GetField("平均售貨天數", "Q")>GetField("平均收帳天數", "Q")[5]+GetField("平均售貨天數", "Q")[5]-GetField("平均收帳天數", "Q")[1]-GetField("平均售貨天數", "Q")[1]
	and GetField("平均收帳天數", "Q")+GetField("平均售貨天數", "Q")<GetField("平均收帳天數", "Q")[5]+GetField("平均售貨天數", "Q")[5]
	and GetField("平均收帳天數", "Q")+GetField("平均售貨天數", "Q")<(GetField("平均收帳天數", "Q")[1]+GetField("平均售貨天數", "Q")[1]+GetField("平均收帳天數", "Q")[2]+GetField("平均售貨天數", "Q")[2])/2)
	or GetField("平均收帳天數", "Q")+GetField("平均售貨天數", "Q")=lowest(GetField("平均收帳天數", "Q")+GetField("平均售貨天數", "Q"),5);
condition3=summation(GetField("來自營運之現金流量", "Q"),4)>0 and GetField("來自營運之現金流量", "Q")>0 and GetField("來自營運之現金流量", "Q")>average(GetField("來自營運之現金流量", "Q")[1],3);
If sel=0 then RET=1; 
If sel=1 then begin
	IF condition1 and condition2 and condition3 and not(trueAll(GetField("月營收", "M")<GetField("月營收", "M")[1],2))
		and GetField("本益比", "D")>5 and GetField("本益比", "D")<=34 and GetField("累計營收年增率", "M")>8 
	then RET=1;
End;
//=========================================================================================
outputfield1(GetFieldDate("每股稅後淨利(元)","Q"),"日期");
outputField2(ROUND(GetField("本益比", "D"),0),"PE");
outputfield4(GetField("累計營收年增率", "M"),"累%");
outputField7(condition1,"曲線A");
outputField8(condition2,"曲線B");
outputField9(condition3,"曲線C");




