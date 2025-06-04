{@type:function|@guid:eaeb340dfad74427bca7179a2c1b70f9}
SetBarMode(0);// XQ: FTI
variable: startdate(0),enddate(0),count(0),scount(0);
variable: bflag(0),bflag2(0),sflag(0),sflag2(0),hbflag(0),hsflag(0),bprice(0),Tbprice(0),bprice1(0),bprice2(0),sprice1(0),sprice2(0),sprice(0),profit(0),Pprofit(0),Lprofit(0),Tprofit(0),BTprofit0(0),BTprofit(0),STprofit(0);

startdate = S_0d_startdate;
enddate = s_0d_enddate;
count=0; scount=0;

//進場邏輯
Condition1=COM_T0B000_SCO(5,5,5);
//出場邏輯
//1Condition2=(((COM_T0S000_SCO(5,5,5)) and (AskAtOpen_trendD(5)) and (bbwidth_trendU(C,20,2))) or ExDividendDate());
//2Condition2=(((COM_T0S000_SCO(5,5,5)) and (AskAtOpen_trendD(5)) and (bidask_trendU(5,5))) or ExDividendDate());
//3Condition2=(((COM_T0S000_SCO(5,5,5)) and (AskAtOpen_trendD(5)) and (Adx_trendU(14))) or ExDividendDate());
//4Condition2=(((COM_T0S000_SCO(5,5,5)) and (AskAtOpen_trendD(5)) and (YDN_trendU(5,5,5))) or ExDividendDate());
Condition2=(((COM_T0S000_SCO(5,5,5)) and (Baseline_trendD(26)) and (bbwidth_trendU(C,20,2))) or ExDividendDate());
//6Condition2=(((COM_T0S000_SCO(5,5,5)) and (Baseline_trendD(26)) and (bidask_trendU(5,5))) or ExDividendDate());
//7Condition2=(((COM_T0S000_SCO(5,5,5)) and (Baseline_trendD(26)) and (Adx_trendU(14))) or ExDividendDate());
//8Condition2=(((COM_T0S000_SCO(5,5,5)) and (Baseline_trendD(26)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//9Condition2=(((COM_T0S000_SCO(5,5,5)) and (YDN_trendD(5,5,5)) and (bbwidth_trendU(C,20,2))) or ExDividendDate());
//10Condition2=(((COM_T0S000_SCO(5,5,5)) and (YDN_trendD(5,5,5)) and (bidask_trendU(5,5))) or ExDividendDate());
//11Condition2=(((COM_T0S000_SCO(5,5,5)) and (YDN_trendD(5,5,5)) and (Adx_trendU(14))) or ExDividendDate());
//12Condition2=(((COM_T0S000_SCO(5,5,5)) and (YDN_trendD(5,5,5)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//13Condition2=(((COM_T0S000_SCO(5,5,5)) and (branches_trendD(20)) and (bbwidth_trendU(C,20,2))) or ExDividendDate());
//14Condition2=(((COM_T0S000_SCO(5,5,5)) and (branches_trendD(20)) and (bidask_trendU(5,5))) or ExDividendDate());
//15Condition2=(((COM_T0S000_SCO(5,5,5)) and (branches_trendD(20)) and (Adx_trendU(14))) or ExDividendDate());
//16Condition2=(((COM_T0S000_SCO(5,5,5)) and (branches_trendD(20)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//17Condition2=(((COM_T0S000_SCO(5,5,5)) and (Controller_trendD(20)) and (bbwidth_trendU(C,20,2))) or ExDividendDate());
//18Condition2=(((COM_T0S000_SCO(5,5,5)) and (Controller_trendD(20)) and (bidask_trendU(5,5))) or ExDividendDate());
//19Condition2=(((COM_T0S000_SCO(5,5,5)) and (Controller_trendD(20)) and (Adx_trendU(14))) or ExDividendDate());
//20Condition2=(((COM_T0S000_SCO(5,5,5)) and (Controller_trendD(20)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//21Condition2=(((COM_T0S000_SCO(5,5,5)) and (Sar_trendD()) and (bbwidth_trendU(C,20,5))) or ExDividendDate());
//22Condition2=(((COM_T0S000_SCO(5,5,5)) and (Sar_trendD()) and (bidask_trendU(5,5))) or ExDividendDate());
//23Condition2=(((COM_T0S000_SCO(5,5,5)) and (Sar_trendD()) and (Adx_trendU(14))) or ExDividendDate());
//24Condition2=(((COM_T0S000_SCO(5,5,5)) and (Sar_trendD()) and (YDN_trendU(5,5,5))) or ExDividendDate());
//25Condition2=(((COM_T0S000_SCO(5,5,5)) and (DMI_trendD()) and (bbwidth_trendU(C,20,5))) or ExDividendDate());
//26Condition2=(((COM_T0S000_SCO(5,5,5)) and (DMI_trendD()) and (bidask_trendU(5,5))) or ExDividendDate());
//27Condition2=(((COM_T0S000_SCO(5,5,5)) and (DMI_trendD()) and (Adx_trendU(14))) or ExDividendDate());
//28Condition2=(((COM_T0S000_SCO(5,5,5)) and (DMI_trendD()) and (YDN_trendU(5,5,5))) or ExDividendDate());
//29Condition2=(((COM_T0S000_SCO(5,5,5)) and (Ssharesheldratio_trendD(20)) and (bbwidth_trendU(C,20,5))) or ExDividendDate());
//30Condition2=(((COM_T0S000_SCO(5,5,5)) and (Ssharesheldratio_trendD(20)) and (bidask_trendU(5,5))) or ExDividendDate());
//31Condition2=(((COM_T0S000_SCO(5,5,5)) and (Ssharesheldratio_trendD(20)) and (Adx_trendU(14))) or ExDividendDate());
//32Condition2=(((COM_T0S000_SCO(5,5,5)) and (Ssharesheldratio_trendD(20)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//33Condition2=(((COM_T0S000_SCO(5,5,5)) and (PVI_trendD(5)) and (bbwidth_trendU(C,20,5))) or ExDividendDate());
//34Condition2=(((COM_T0S000_SCO(5,5,5)) and (PVI_trendD(5)) and (bidask_trendU(5,5))) or ExDividendDate());
//35Condition2=(((COM_T0S000_SCO(5,5,5)) and (PVI_trendD(5)) and (Adx_trendU(14))) or ExDividendDate());
//36Condition2=(((COM_T0S000_SCO(5,5,5)) and (PVI_trendD(5)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//37Condition2=(((COM_T0S000_SCO(5,5,5)) and (EMA20_trendD(C,20)) and (bbwidth_trendU(C,20,5))) or ExDividendDate());
//38Condition2=(((COM_T0S000_SCO(5,5,5)) and (EMA20_trendD(C,20)) and (bidask_trendU(5,5))) or ExDividendDate());
//39Condition2=(((COM_T0S000_SCO(5,5,5)) and (EMA20_trendD(C,20)) and (Adx_trendU(14))) or ExDividendDate());
//40Condition2=(((COM_T0S000_SCO(5,5,5)) and (EMA20_trendD(C,20)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//41Condition2=(((COM_T0S000_SCO(5,5,5)) and (foreign_trendD(20)) and (bbwidth_trendU(C,20,5))) or ExDividendDate());
//42Condition2=(((COM_T0S000_SCO(5,5,5)) and (foreign_trendD(20)) and (bidask_trendU(5,5))) or ExDividendDate());
//43Condition2=(((COM_T0S000_SCO(5,5,5)) and (foreign_trendD(20)) and (Adx_trendU(14))) or ExDividendDate());
//44Condition2=(((COM_T0S000_SCO(5,5,5)) and (foreign_trendD(20)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//45Condition2=(((COM_T0S000_SCO(5,5,5)) and (Gupo_trendD(6,9,5)) and (bbwidth_trendU(C,20,5))) or ExDividendDate());
//46Condition2=(((COM_T0S000_SCO(5,5,5)) and (Gupo_trendD(6,9,5)) and (bidask_trendU(5,5))) or ExDividendDate());
//47Condition2=(((COM_T0S000_SCO(5,5,5)) and (Gupo_trendD(6,9,5)) and (Adx_trendU(14))) or ExDividendDate());
//48Condition2=(((COM_T0S000_SCO(5,5,5)) and (Gupo_trendD(6,9,5)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//49Condition2=(((COM_T0S000_SCO(5,5,5)) and (investor_trendD(20)) and (bbwidth_trendU(C,20,5))) or ExDividendDate());
//50Condition2=(((COM_T0S000_SCO(5,5,5)) and (investor_trendD(20)) and (bidask_trendU(5,5))) or ExDividendDate());
//51Condition2=(((COM_T0S000_SCO(5,5,5)) and (investor_trendD(20)) and (Adx_trendU(14))) or ExDividendDate());
//52Condition2=(((COM_T0S000_SCO(5,5,5)) and (investor_trendD(20)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//53Condition2=(((COM_T0S000_SCO(5,5,5)) and (MA20_trendD(c,20)) and (bbwidth_trendU(C,20,5))) or ExDividendDate());
//54Condition2=(((COM_T0S000_SCO(5,5,5)) and (MA20_trendD(c,20)) and (bidask_trendU(5,5))) or ExDividendDate());
//55Condition2=(((COM_T0S000_SCO(5,5,5)) and (MA20_trendD(c,20)) and (Adx_trendU(14))) or ExDividendDate());
//56Condition2=(((COM_T0S000_SCO(5,5,5)) and (MA20_trendD(c,20)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//57Condition2=(((COM_T0S000_SCO(5,5,5)) and (Macd_trendD()) and (bbwidth_trendU(C,20,5))) or ExDividendDate());
//58Condition2=(((COM_T0S000_SCO(5,5,5)) and (Macd_trendD()) and (bidask_trendU(5,5))) or ExDividendDate());
//59Condition2=(((COM_T0S000_SCO(5,5,5)) and (Macd_trendD()) and (Adx_trendU(14))) or ExDividendDate());
//60Condition2=(((COM_T0S000_SCO(5,5,5)) and (Macd_trendD()) and (YDN_trendU(5,5,5))) or ExDividendDate());
//61Condition2=(((COM_T0S000_SCO(5,5,5)) and (MFI_trendD(6)) and (bbwidth_trendU(C,20,5))) or ExDividendDate());
//62Condition2=(((COM_T0S000_SCO(5,5,5)) and (MFI_trendD(6)) and (bidask_trendU(5,5))) or ExDividendDate());
//63Condition2=(((COM_T0S000_SCO(5,5,5)) and (MFI_trendD(6)) and (Adx_trendU(14))) or ExDividendDate());
//64Condition2=(((COM_T0S000_SCO(5,5,5)) and (MFI_trendD(6)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//65Condition2=(((COM_T0S000_SCO(5,5,5)) and (OBDifference_trendD(20)) and (bbwidth_trendU(C,20,5))) or ExDividendDate());
//66Condition2=(((COM_T0S000_SCO(5,5,5)) and (OBDifference_trendD(20)) and (bidask_trendU(5,5))) or ExDividendDate());
//67Condition2=(((COM_T0S000_SCO(5,5,5)) and (OBDifference_trendD(20)) and (Adx_trendU(14))) or ExDividendDate());
//68Condition2=(((COM_T0S000_SCO(5,5,5)) and (OBDifference_trendD(20)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//69Condition2=(((COM_T0S000_SCO(5,5,5)) and (Retaildifference_trendD(5)) and (bbwidth_trendU(C,20,5))) or ExDividendDate());
//70Condition2=(((COM_T0S000_SCO(5,5,5)) and (Retaildifference_trendD(5)) and (bidask_trendU(5,5))) or ExDividendDate());
//71Condition2=(((COM_T0S000_SCO(5,5,5)) and (Retaildifference_trendD(5)) and (Adx_trendU(14))) or ExDividendDate());
//72Condition2=(((COM_T0S000_SCO(5,5,5)) and (Retaildifference_trendD(5)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//73Condition2=(((COM_T0S000_SCO(5,5,5)) and (Pomremainratio_trendD(5)) and (bbwidth_trendU(C,20,5))) or ExDividendDate());
//74Condition2=(((COM_T0S000_SCO(5,5,5)) and (Pomremainratio_trendD(5)) and (bidask_trendU(5,5))) or ExDividendDate());
//75Condition2=(((COM_T0S000_SCO(5,5,5)) and (Pomremainratio_trendD(5)) and (Adx_trendU(14))) or ExDividendDate());
//76Condition2=(((COM_T0S000_SCO(5,5,5)) and (Pomremainratio_trendD(5)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//77Condition2=(((COM_T0S000_SCO(5,5,5)) and (pomusingratio_trendD(5)) and (bbwidth_trendU(C,20,5))) or ExDividendDate());
//78Condition2=(((COM_T0S000_SCO(5,5,5)) and (pomusingratio_trendD(5)) and (bidask_trendU(5,5))) or ExDividendDate());
//79Condition2=(((COM_T0S000_SCO(5,5,5)) and (pomusingratio_trendD(5)) and (Adx_trendU(14))) or ExDividendDate());
//80Condition2=(((COM_T0S000_SCO(5,5,5)) and (pomusingratio_trendD(5)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//81Condition2=(((COM_T0S000_SCO(5,5,5)) and (FTI_SupertrendD()) and (bbwidth_trendU(C,20,5))) or ExDividendDate());
//82Condition2=(((COM_T0S000_SCO(5,5,5)) and (FTI_SupertrendD()) and (bidask_trendU(5,5))) or ExDividendDate());
//83Condition2=(((COM_T0S000_SCO(5,5,5)) and (FTI_SupertrendD()) and (Adx_trendU(14))) or ExDividendDate());
//84Condition2=(((COM_T0S000_SCO(5,5,5)) and (FTI_SupertrendD()) and (YDN_trendU(5,5,5))) or ExDividendDate());
//85Condition2=(((COM_T0S000_SCO(5,5,5)) and (DSelfdifference_trendU(20)) and (bbwidth_trendU(C,20,5))) or ExDividendDate());
//86Condition2=(((COM_T0S000_SCO(5,5,5)) and (DSelfdifference_trendU(20)) and (bidask_trendU(5,5))) or ExDividendDate());
//87Condition2=(((COM_T0S000_SCO(5,5,5)) and (DSelfdifference_trendU(20)) and (Adx_trendU(14))) or ExDividendDate());
//88Condition2=(((COM_T0S000_SCO(5,5,5)) and (DSelfdifference_trendU(20)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//89Condition2=(((COM_T0S000_SCO(5,5,5)) and (Longstop_trendD) and (bbwidth_trendU(C,20,5))) or ExDividendDate());
//90Condition2=(((COM_T0S000_SCO(5,5,5)) and (Longstop_trendD) and (bidask_trendU(5,5))) or ExDividendDate());
//91Condition2=(((COM_T0S000_SCO(5,5,5)) and (Longstop_trendD) and (Adx_trendU(14))) or ExDividendDate());
//92Condition2=(((COM_T0S000_SCO(5,5,5)) and (Longstop_trendD) and (YDN_trendU(5,5,5))) or ExDividendDate());
//93Condition2=(((COM_T0S000_SCO(5,5,5)) and (PVT_trendD(5)) and (bbwidth_trendU(C,20,5))) or ExDividendDate());
//94Condition2=(((COM_T0S000_SCO(5,5,5)) and (PVT_trendD(5)) and (bidask_trendU(5,5))) or ExDividendDate());
//95Condition2=(((COM_T0S000_SCO(5,5,5)) and (PVT_trendD(5)) and (Adx_trendU(14))) or ExDividendDate());
//96Condition2=(((COM_T0S000_SCO(5,5,5)) and (PVT_trendD(5)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//97Condition2=(((COM_T0S000_SCO(5,5,5)) and (TDN_K1S(5,5,5)) and (bbwidth_trendU(C,20,5))) or ExDividendDate());
//98Condition2=(((COM_T0S000_SCO(5,5,5)) and (TDN_K1S(5,5,5)) and (bidask_trendU(5,5))) or ExDividendDate());
//99Condition2=(((COM_T0S000_SCO(5,5,5)) and (TDN_K1S(5,5,5)) and (Adx_trendU(14))) or ExDividendDate());
//100Condition2=(((COM_T0S000_SCO(5,5,5)) and (TDN_K1S(5,5,5)) and (YDN_trendU(5,5,5))) or ExDividendDate());
//101Condition2=(((COM_T0S000_SCO(5,5,5)) and (AskAtOpen_trendD(5))) or ExDividendDate());
//102Condition2=(((COM_T0S000_SCO(5,5,5)) and (Baseline_trendD(26))) or ExDividendDate());
//103Condition2=(((COM_T0S000_SCO(5,5,5)) and (YDN_trendD(5,5,5))) or ExDividendDate());
//104Condition2=(((COM_T0S000_SCO(5,5,5)) and (branches_trendD(20))) or ExDividendDate());
//105Condition2=(((COM_T0S000_SCO(5,5,5)) and (Controller_trendD(20))) or ExDividendDate());
//106Condition2=(((COM_T0S000_SCO(5,5,5)) and (Sar_trendD())) or ExDividendDate());
//107Condition2=(((COM_T0S000_SCO(5,5,5)) and (DMI_trendD())) or ExDividendDate());
//108Condition2=(((COM_T0S000_SCO(5,5,5)) and (Ssharesheldratio_trendD(20))) or ExDividendDate());
//109Condition2=(((COM_T0S000_SCO(5,5,5)) and (PVI_trendD(5))) or ExDividendDate());
//110Condition2=(((COM_T0S000_SCO(5,5,5)) and (EMA20_trendD(C,20))) or ExDividendDate());
//111Condition2=(((COM_T0S000_SCO(5,5,5)) and (foreign_trendD(20))) or ExDividendDate());
//112Condition2=(((COM_T0S000_SCO(5,5,5)) and (Gupo_trendD(6,9,5))) or ExDividendDate());
//113Condition2=(((COM_T0S000_SCO(5,5,5)) and (investor_trendD(20))) or ExDividendDate());
//114Condition2=(((COM_T0S000_SCO(5,5,5)) and (MA20_trendD(c,20))) or ExDividendDate());
//115Condition2=(((COM_T0S000_SCO(5,5,5)) and (Macd_trendD())) or ExDividendDate());
//116Condition2=(((COM_T0S000_SCO(5,5,5)) and (MFI_trendD(6))) or ExDividendDate());
//117Condition2=(((COM_T0S000_SCO(5,5,5)) and (OBDifference_trendD(20))) or ExDividendDate());
//118Condition2=(((COM_T0S000_SCO(5,5,5)) and (Retaildifference_trendD(5))) or ExDividendDate());
//119Condition2=(((COM_T0S000_SCO(5,5,5)) and (Pomremainratio_trendD(5))) or ExDividendDate());
//120Condition2=(((COM_T0S000_SCO(5,5,5)) and (pomusingratio_trendD(5))) or ExDividendDate());
//121Condition2=(((COM_T0S000_SCO(5,5,5)) and (FTI_SupertrendD())) or ExDividendDate());
//122Condition2=(((COM_T0S000_SCO(5,5,5)) and (DSelfdifference_trendU(20))) or ExDividendDate());
//123Condition2=(((COM_T0S000_SCO(5,5,5)) and (Longstop_trendD)) or ExDividendDate());
//124Condition2=(((COM_T0S000_SCO(5,5,5)) and (PVT_trendD(5))) or ExDividendDate());
//125Condition2=(((COM_T0S000_SCO(5,5,5)) and (TDN_K1S(5,5,5))) or ExDividendDate());
//126Condition2=(((COM_T0S000_SCO(5,5,5)) and (bbwidth_trendU(C,20,2))) or ExDividendDate());
//127Condition2=(((COM_T0S000_SCO(5,5,5)) and (bidask_trendU(5,5))) or ExDividendDate());
//128Condition2=(((COM_T0S000_SCO(5,5,5)) and (Adx_trendU(14))) or ExDividendDate());
//129Condition2=(((COM_T0S000_SCO(5,5,5)) and (YDN_trendU(5,5,5))) or ExDividendDate());

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

S1_SCO_T0S005=floor(BTprofit);