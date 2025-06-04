{@type:indicator|@guid:d0741b5e72f841e79c680fdf08f3c41c}
//XQ:
variable: up(0), down(0), mid(0),up1(0),down1(0),mid1(0),up2(0), down2(0);
variable: pb(0),ydn_dif(0),ydn_pb(0),ydntrend(0),ydntrend_dif(0),ydntrend_pb(0),
          c_ydn_pbdif(0),c_ydntrend_pbdif(0),ydn_pb_ydntrend_pb(0);
variable: startdate(0),enddate(0);
variable: Longstop(0),Shortstop(0),barH(0),iRate100(0);
variable: bflag(0),bflag2(0),sflag(0),sflag2(0),hbflag(0),hsflag(0),bprice(0),Tbprice(0),bprice1(0),bprice2(0),sprice1(0),sprice2(0),sprice(0),
         profit(0),Pprofit(0),Lprofit(0),Tprofit(0),BTprofit0(0),BTprofit(0),STprofit(0);
variable: count(0),scount(0),count1(0),count2(0),count3(0),Tcount(0),countx(0),county(0),Pcount(0),Lcount(0),Mcount(0),xcount(0),
         yieldratio(0),plratio(0),ProfitFactor(0),_max_profit(0),_max_loss(0),_max_BTprofit(0),_intraday_drawdown(0),_max_intraday_drawdown(0)
		 ,_max_consecutive_wins(0),_consecutive_wins(0),_max_consecutive_losses(0),_consecutive_losses(0)
		 ,_human_factor(0),_loss_win_ratio(0);			 

startdate = S_0d12_startdate;
enddate = s_0d12_enddate;
count=0; scount=0;
//進場邏輯
Condition1=COM_T0B000_SCO(5,5,5);
//出場邏輯
Condition2=(((COM_T0S000_SCO(5,5,5)) and (YDN_trendD(5,5,5)) and (bidask_trendU(5,5))) or ExDividendDate());

if condition1 then count=count+1; 
if condition2 then scount=scount+1;

if condition1 then    
   plot1(low * 0.99, "entry");

if condition2 then
   plot2(high * 1.01, "exit");