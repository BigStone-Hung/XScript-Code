{@type:sensor|@guid:8a9f7d2fc7a84de2b95638f936ccbf88}
input: atVolume(1000,"連續買進金額(萬)");
input: LaTime(5,"連續外盤筆數");
input:TXT("須逐筆洗價","使用限制");
settotalbar(10);

variable: intrabarpersist Xtime(0);//計數器

if GetQuote("BidAskFlag")=-1 then Xtime =0; //內盤成交時計數器歸零
if GetQuote("BidAskFlag")=1 then Xtime+=1; //外盤成交後開始計算次數

if q_VolumeRatio>3 then begin//估量>昨量
   if Xtime>LaTime then begin//連續外盤>設定次數
      if summation(GetField("成交量","Tick")*close,LaTime)>atVolume*10 then begin //累計外盤量>設定金額
      ret=1;
      end;	  
   end;
end;