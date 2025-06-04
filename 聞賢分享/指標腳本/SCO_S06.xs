{@type:indicator|@guid:1534f7425b0d47cb8b6e6bd54ba270bd}
//XQ:
variable: startdate(0),enddate(0);
variable: bflag(0),bflag2(0),sflag(0),sflag2(0),hbflag(0),hsflag(0),bprice(0),Tbprice(0),bprice1(0),bprice2(0),sprice1(0),sprice2(0),sprice(0),profit(0),Pprofit(0),Lprofit(0),Tprofit(0),BTprofit0(0),BTprofit(0),STprofit(0);
variable: count(0),scount(0),count1(0),count2(0),count3(0),Tcount(0),countx(0),county(0),Pcount(0),Lcount(0),Mcount(0),xcount(0),
         yieldratio(0),plratio(0),ProfitFactor(0),_max_profit(0),_max_loss(0),_max_BTprofit(0),_intraday_drawdown(0),_max_intraday_drawdown(0)
		 ,_max_consecutive_wins(0),_consecutive_wins(0),_max_consecutive_losses(0),_consecutive_losses(0)
		 ,_human_factor(0),_loss_win_ratio(0);	
		 
startdate = S_0d_startdate;
enddate = s_0d_enddate;
count=0; scount=0;
///進場邏輯
Condition1=COM_T0B000_SCO(5,5,5);
//出場邏輯
//Condition2=(((COM_T0S000_SCO(5,5,5)) and (AskAtOpen_trendD(5)) and (bbwidth_trendU(C,20,2))) or ExDividendDate());
//2Condition2=(((COM_T0S000_SCO(5,5,5)) and (AskAtOpen_trendD(5)) and (bidask_trendU(5,5))) or ExDividendDate());
//3Condition2=(((COM_T0S000_SCO(5,5,5)) and (AskAtOpen_trendD(5)) and (Adx_trendU(14))) or ExDividendDate());
//4Condition2=(((COM_T0S000_SCO(5,5,5)) and (AskAtOpen_trendD(5)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//5Condition2=(((COM_T0S000_SCO(5,5,5)) and (Baseline_trendD(26)) and (bbwidth_trendU(C,20,2))) or ExDividendDate());
Condition2=(((COM_T0S000_SCO(5,5,5)) and (Baseline_trendD(26)) and (bidask_trendU(5,5))) or ExDividendDate());
//7Condition2=(((COM_T0S000_SCO(5,5,5)) and (Baseline_trendD(26)) and (Adx_trendU(14))) or ExDividendDate());
//8Condition2=(((COM_T0S000_SCO(5,5,5)) and (Baseline_trendD(26)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//9Condition2=(((COM_T0S000_SCO(5,5,5)) and (YDN_trendD(5,5,5)) and (bbwidth_trendU(C,20,2))) or ExDividendDate());
//10Condition2=(((COM_T0S000_SCO(5,5,5)) and (YDN_trendD(5,5,5)) and (bidask_trendU(5,5))) or ExDividendDate());

if condition1 then count=count+1; 
if condition2 then scount=scount+1;
//先買後賣邏輯....................................................................................
if date>=startdate and date<=enddate and count[1]>=1 and bflag[1]=0 and sflag[1]=0  then 
begin
 hbflag=11;
 sflag=0;
 bprice=O;
end;
if date>=startdate and date<=enddate and count[1]>=1 and  (sflag[1]=1 or hbflag[1]=0) and bflag[1]=0 then
begin 
  bflag=1;
  sflag=0;
  bprice=O;
 end;

if date>=startdate and date<=enddate and Scount[1]>=1 and  (bflag[1]=1 or hbflag[1]=11) and sflag[1]=0 then 
begin
 bflag=0;
 sflag=1;
 sprice=O;
   profit=(sprice-bprice)*1000-floor(bprice*1.425)-floor(sprice*1.425)-floor(sprice*3);
   BTprofit+=(sprice-bprice)*1000-floor(bprice*1.425)-floor(sprice*1.425)-floor(sprice*3);
end;

if  date>enddate and (hbflag[1]=11 or bflag[1]=1 )and sflag[1]=0  then
begin 
  bflag=0;
  sflag=0;
  hbflag=0;
  hsflag=0;
  sprice=C;
  if  date>=startdate and date<=enddate and bprice>0 then
   begin
   profit=(sprice-bprice)*1000-floor(bprice*1.425)-floor(sprice*1.425)-floor(sprice*3);
   end;
   BTprofit+=(sprice-bprice)*1000-floor(bprice*1.425)-floor(sprice*1.425)-floor(sprice*3);
end;
plot1(floor(BTprofit),"總金額1 ");

if  date>=startdate and date<=enddate and bprice>0 and profit>0 and (profit>profit[1] or profit<profit[1]) then
   begin
   Pprofit=Pprofit+profit;
   end;
  //plot2(Pprofit,"累計獲利金額");
  //................................................
  if  date>=startdate and date<=enddate and bprice>0 and profit<0 and (profit>profit[1] or profit<profit[1]) then
   begin
   Lprofit=Lprofit+profit;
   end;
  //plot3(Lprofit,"累計損失金額");
  //.................................................
   if  date>=startdate and date<=enddate and bprice>0 and profit>0 and (profit>profit[1] or profit<profit[1]) then
   begin
   pcount=pcount+1;
   end;
//plot4(pcount,"累計獲利次數");
  //................................................
  if  date>=startdate and date<=enddate and bprice>0 and profit<0 and (profit<profit[1] or profit>profit[1]) then
   begin
   Lcount=Lcount+1;
   end;
  //plot5(Lcount,"累計損失次數");
  //................................................
  Tcount=(Pcount+Lcount);  //總次數
plot5(Tcount,"總次數");

   if Tcount>0 then
   yieldratio=pcount*100/Tcount;  //成功率
plot6(yieldratio,"成功率");

  //................................................
   if Pcount>0 and Lcount>0 then
   plratio=(Pprofit/Pcount)/-(Lprofit/Lcount);  //賺陪比
plot7(plratio,"賺陪比");

  //................................................
   if Lprofit<0 then
   ProfitFactor = -Pprofit/Lprofit; //獲利因子
plot8(ProfitFactor,"獲利因子");

//................................................
//if profit>_max_profit then
	//_max_profit=profit; 
   value61=((yieldratio/100)*plratio)-(1-(yieldratio/100));  //期望值    
plot9(value61,"期望值");
  //................................................
//if profit>_max_profit then
	//_max_profit=profit; 
   //value61=_max_profit;  //單筆最大獲利金額    
//plot9(floor(value61),"單筆最大獲利");

   if profit<_max_loss then
	_max_loss=profit;
   value62=_max_loss;  //單筆最大損失金額
plot10(floor(value62),"單筆大損失");

if BTprofit>_max_BTprofit then
	_max_BTprofit=BTprofit;
   value63=_max_BTprofit;  //累計最大獲利金額

// 累計回吐金額
_intraday_drawdown=value16-BTprofit;

// 累計最大回吐金額MDD
if _intraday_drawdown>_max_intraday_drawdown then
	_max_intraday_drawdown=_intraday_drawdown;     
  value65=_max_intraday_drawdown;  //累計最大回吐金額MDD
plot12(value65,"MDD");
//plot13(floor(value65),"MDD");

// 連續最大獲利次數
if BTprofit<BTprofit[1] then 
	_consecutive_wins=0
else if BTprofit=BTprofit[1] then
	_consecutive_wins=_consecutive_wins[1]
else if BTprofit>BTprofit[1] then
	_consecutive_wins=_consecutive_wins[1]+1;

if _consecutive_wins>_max_consecutive_wins then
	_max_consecutive_wins=_consecutive_wins;  
  value66=_max_consecutive_wins;  //連續最大獲利次數  
//plot15(value66,"連利次數");

if BTprofit>BTprofit[1] then
	_consecutive_losses=0
else if BTprofit=BTprofit[1] then
	_consecutive_losses=_consecutive_losses[1]
else if BTprofit<BTprofit[1] then
	_consecutive_losses=_consecutive_losses[1]+1;
if _consecutive_losses>_max_consecutive_losses then
	_max_consecutive_losses=_consecutive_losses; 
value67=_max_consecutive_losses;  //連續最大虧損次數
//plot16(xcount,"損益總次數");
plot17(value67,"連虧次數");

value71=plratio+ ProfitFactor; 
//plot20(value71,"plratio+ ProfitFactor");
 
// 人性化因子(賺賠比-輸贏比)
if plratio>0 then
begin
	_loss_win_ratio=Lcount/Pcount;
	_human_factor=plratio-_loss_win_ratio;
end;
plot21(_human_factor, "人性化因子"); 