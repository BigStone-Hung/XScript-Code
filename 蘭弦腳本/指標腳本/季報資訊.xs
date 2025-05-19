{@type:indicator|@guid:25fa6edcda9a492f9503fe3a29a39970}
input:plotmode(1,"主副圖:", inputkind:=Dict (["營收",1],["天數",2],["現流",3],["全部",4]),quickedit:=true);
IF plotmode=1 then begin
	PLOT11(GetField("營業收入淨額", "Q"),"營業收入",checkbox:=1);
	PLOT12(GetField("營收成長率", "Q"),"營收成長率",checkbox:=1);
	PLOT13(GetField("營業毛利率", "Q"),"毛利率",checkbox:=1);
	PLOT19(0,"========",checkbox:=0);
End;
IF plotmode=2 then begin
	PLOT21(GetField("平均收帳天數", "Q"),"收款天數",checkbox:=1);
	PLOT22(GetField("平均售貨天數", "Q"),"存貨天數",checkbox:=1);
	PLOT29(0,"========",checkbox:=0);
End;
IF plotmode=3 then begin
	PLOT31(GetField("現金及約當現金", "Q"),"在手現金",checkbox:=1);
	PLOT32(GetField("來自營運之現金流量", "Q"),"營運現流",checkbox:=1);
	PLOT33(GetField("資本支出金額", "Q"),"資本支出",checkbox:=1);
	PLOT34(GetField("自由現金流量", "Q"),"自由現流",checkbox:=1);
	PLOT35(GetField("投資活動之現金流量", "Q"),"投資現流",checkbox:=1);
	PLOT36(GetField("理財活動之現金流量", "Q"),"理財現流",checkbox:=1);
	PLOT39(0,"========",checkbox:=0);
End;
IF plotmode=4 then begin
	PLOT11(GetField("營業收入淨額", "Q"),"營業收入",checkbox:=0);
	PLOT12(GetField("營收成長率", "Q"),"營收成長率",checkbox:=0);
	PLOT13(GetField("營業毛利率", "Q"),"毛利率",checkbox:=0);
	PLOT19(0,"========",checkbox:=0);
	PLOT21(GetField("平均收帳天數", "Q"),"收款天數",checkbox:=0);
	PLOT22(GetField("平均售貨天數", "Q"),"存貨天數",checkbox:=0);
	PLOT29(0,"========",checkbox:=0);
	PLOT31(GetField("現金及約當現金", "Q"),"在手現金",checkbox:=0);
	PLOT32(GetField("來自營運之現金流量", "Q"),"營運現流",checkbox:=0);
	PLOT33(GetField("資本支出金額", "Q"),"資本支出",checkbox:=0);
	PLOT34(GetField("自由現金流量", "Q"),"自由現流",checkbox:=0);
	PLOT35(GetField("投資活動之現金流量", "Q"),"投資現流",checkbox:=0);
	PLOT36(GetField("理財活動之現金流量", "Q"),"理財現流",checkbox:=0);
	PLOT39(0,"========",checkbox:=0);
	PLOT41(GetField("營業費用", "Q"),"營業費用",checkbox:=0);
	PLOT42(GetField("研發費用", "Q"),"研發費用",checkbox:=0);
	PLOT43(GetField("營業利益率", "Q"),"利益率",checkbox:=0);
	PLOT44(GetField("稅後淨利率", "Q"),"淨利率",checkbox:=0);
	PLOT45(GetField("稅後淨利成長率", "Q"),"淨利成長率",checkbox:=0);	
	PLOT46(GetField("每股稅後淨利(元)", "Q"),"EPS",checkbox:=1);	
	PLOT47(GetField("本益比", "D"),"PE",checkbox:=1);
	//PLOT17(GetField("負債比率", "Q"),"負債比率",checkbox:=0);
	//PLOT20(GetField("固定資產報酬率", "Q"),"ROA",checkbox:=0);
	PLOT48(GetField("預收款項", "Q"),"預收款項",checkbox:=0);
	PLOT49(GetField("股東權益報酬率", "Q"),"ROE",checkbox:=0);
	PLOT50(GetField("資產報酬率", "Q"),"ROA",checkbox:=0);
End;

