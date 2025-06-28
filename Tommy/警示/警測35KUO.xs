{@type:sensor|@guid:c4f0dab598314087a1c46e27905a30b0}

if q_PriceChangeRatio<5.5 and close>10 and close<300 and volume>100 then begin
//5分K 的EMA均線排列, 需達5日>10日>20日>30日
condition1=average(close,5)>average(close,10)
           and average(close,10)>average(close,20);
condition2=average(close,5)>average(close,5)[1]
           and average(close,10)>average(close,10)[1]
		   and average(close,20)>average(close,20)[1]
		   and average(close,30)>average(close,30)[1];
		   
//(布林軌道) UB 2.10 往上/BBand MA20 往上/LB  2.10 箭頭往下
condition3=BollingerBand(Close,10,2)>BollingerBand(Close,10,2)[1]
           and BollingerBand(Close,10,-2)<BollingerBand(Close,10,-2)[1]
           and average(close,20)>average(close,20)[1];
//加速器
variable:Xslope(0);
Xslope = linearregslope((H+L)/(H+L)[20],20);
condition4=Xslope>Xslope[1] and (Xslope-Xslope[1])>(Xslope[1]-Xslope[2]);

//分鐘與日DMI 呈現10分+DI往上,10分-DI往下,10分ADX往上＊參數: 天數2/跨頻率週期10分鐘
xfMin_DirectionMovement("10", 2, value11, value12, value13);
condition5=value11>value11[1] and value12<value12[1] and value13>value13[1];

//買賣力呈現[正值]
condition6=q_OutSize>q_InSize;

//天羅地網線,數值由大而小依序排列 +2SD往上/+1SD往上/MA往上   參數設定:期數5
value5=average(close,5);
value6=standarddev(close,5,1);
value7=value5+value6;//+1sd
value8=value5+2*value6;//+2sd
value9=value5-value6;//-1sd
value10=value5-2*value6;//-2sd
condition7=value5>value5[1] and value8>value8[1] and value7>value7[1];

//K棒衍生指標,多空淨力值呈現[正值]
array:k[22](0);
if close<>0 then begin
	//最近一日與前一日的多空力道總差額
	k[1]=(open-open[1])/close;
	k[2]=(high-high[1])/close;
	k[3]=(low-low[1])/close;
	k[4]=(close-close[1])/close;
	//當日
	k[5]=(high-low)/close;
	k[6]=(high-close)/close;
	k[7]=(high-open)/close;
	k[8]=(open-low)/close;
	k[9]=(close-open)/close;
	k[10]=(close-low)/close;
	k[11]=(open-high[1])/close;
	k[12]=(open-low[1])/close;
	k[13]=(open-close[1])/close;
	k[14]=(high-open[1])/close;
	k[15]=(high-low[1])/close;
	k[16]=(high-close[1])/close;
	k[17]=(low-open[1])/close;
	k[18]=(low-high[1])/close;
	k[19]=(low-close[1])/close;
	k[20]=(close-open[1])/close;
	k[21]=(close-high[1])/close;
	k[22]=(close-low[1])/close;
end;
array: v1[8](0);
v1[1]=k[1]+k[11]+k[12]+k[13];//隔日開盤多空總力道
v1[2]=k[1]+k[2]+k[3]+k[4];//隔日多空總力道
v1[3]=k[20]+k[21]+k[22];//隔日收盤多空結果
v1[4]=k[9]+k[10]-k[6];//當日收盤多空結果
v1[5]=k[14]+k[15]+k[16];//多頭最大力量
v1[6]=(k[17]+k[18]+k[19])*-1;//空頭最大力量
v1[7]=k[7]+k[9]+k[10];//當日多頭最大力量
v1[8]=k[6]+k[8]-k[10];//當日空頭最大力量
value1=v1[1]+v1[2]+v1[3]+v1[4];
condition8=average(value1,5)>0 and average(value1,5)>average(value1,5)[1];
	  
if condition1 and condition2 and condition3 and condition4 and condition5 and condition6 
   and condition7 and condition8 then begin
   ret=1;
   end;
end;