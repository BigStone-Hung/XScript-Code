{@type:indicator}
//===============參數區===========================
settotalBar(0);
input: mode(1,"主圖",inputkind:=dict (["主圖",1],["單次損益",2],["累計損益",3]),quickedit:=true);
variable: mkp(0), B_Cost(0), S_Cost(0),costfee(4);//進出與滑價成本4點
Var:JJ(0),AA(0),B(0),CC(0),D(0);
var: intraBarPersist realtime_profit(0),  intraBarPersist trans_counter(0), intraBarPersist first_flag(0);
                    //未平倉損益            第幾筆交易                          正在起算第一筆資料先做多
//===============均線資訊================
JJ=(C+H+L)/2;
AA=EMA(JJ,21);
B=AA[1];
CC=EMA(JJ,233);
//===============(起算點)===============
//最開始的訊號，多空都可以起算，所以只取上或下的某一邊(站上CC就做多)
if trans_counter=0 then
begin 
	if mkp=0 and C>CC then  //多單進場，只跑第一筆
		begin 
		mkp=0;
		trans_counter=trans_counter+1;
		first_flag=1;
		end;
end;
if trans_counter>0 and first_flag=1  then //第一筆多單出場
begin 
	if AA<CC then first_flag=0; 
end;

//===============(空)進場================
if trans_counter>=0 and first_flag=0 then 
begin 
if mkp>=0 and AA<B then
  begin 
	mkp=-1;
    S_Cost=C-2;  //掛價讓2點
  end;
end;
//===============(空)出場================

if mkp=-1 and AA>CC then
//or (mkp=-1 and S_Cost-C>=30 or S_Cost-C<=-40) then
  begin
	mkp=0;
    B_Cost=c+2; //掛價讓2點
  end;  

//================計算損益區===========================

IF MKP=0 THEN VALUE555=0;  //value555=即時損益
VALUE666=0;                //value666=出場損益


if mkp<=-1 then 
  begin       
value555=(S_cost-C)-CostFee;
  end;
if mkp>=1 then 
  begin
value555=(C-B_cost)-CostFee;
  end;

if mkp[1]=-1 and mkp>=0 then 
  begin 
value666=(S_cost-C)-costfee;
  end;
if mkp[1]>=1 and mkp<=0 then
   begin
value666=(C-B_cost)-costfee; //value666=出場損益
  end;
  
value777+=value666;  //value777=累計損益

if value777>value888 then value888=value777 else value888=value888;  //最高獲利

if value666[1]=0 and value666<>0 then value543+=1;  //進場次數

if value666[1]=0 and value666>0 then
   begin value542+=1;  //計算勝場數
         value667+=value666;  //計算獲利合計
		 value668=value667-value777; //計算虧損合計(=總獲利value667-總損益value777)
		 if value668<>0 then value669=value667/value668; //計算獲利因子
   end;

if value543>0 and value542>0 then value540=round(value542/value543*100,0); //勝率%

   

//=================主圖區=====================

if mode=1 then
  begin
     if mkp[1]>=0 and mkp=-1 then plot1(c,"空方進場圖");
     if mkp=-1 then plot3(S_cost,"做空提示");
	 //if mkp[1]=-1 and mkp=0 then plot5(c,"多單出場");
     if mkp[1]=-1 and mkp>=0 then plot6(c,"空單出場");
  plot7(AA,"短均線");
  plot8(B,"上一根的長均線值");
  plot9(CC,"長均線");
  if mkp<=-1 then 
  begin Plot14(s_cost,"空方綠框"); Plot15(minlist(O,C),"空方黑框"); end;
 end;

//====================即時損益區==============================

IF MODE=2 then
begin
     PLOT21(VALUE555,"即時損益(點)");
     PLOT22(VALUE666,"出場損益(扣滑價12點)");
	 if mkp=-1 then 
	 begin plot23(S_Cost,"進場成本點位");
	       plot3(S_cost,"做空提示");
     end;
	 if mkp[1]=-1 and mkp>=0 then plot6(c,"空單出場");
END;

//====================累計損益===============================

if mode=3 then begin
   plot31(value777,"空單賺賠累計獲利(點數)");
   plot32(value888,"最高獲利(點數)");
   plot33(value543,"進場次數");
   plot34(value542,"勝場數");
   plot35(value540,"勝率%");
   plot38(value667,"只看獲利的累計");
   plot39(value668,"只看虧損的累計");
   plot40(value669,"獲利因子");

   end;
//end;