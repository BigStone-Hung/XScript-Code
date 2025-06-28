{@type:sensor|@guid:30b96c341dce48a29e963c8a78113dda}
input: atVolume(1000,"連續買進金額(萬)");
input: LaTime(5,"連續外盤筆數");
input:TXT("須逐筆洗價","使用限制");
settotalbar(10);

variable: intrabarpersist Xtime(0);//計數器

if GetQuote("BidAskFlag")=1 then Xtime =0; //外盤成交則計數器歸零
if GetQuote("BidAskFlag")=-1 then Xtime+=1; //計算內盤次數

if q_VolumeRatio>3 then begin//估量>昨量
  if Xtime>LaTime then begin //內盤次數>設定
     if summation(GetField("成交量","Tick")*close,5)>atVolume*10 then begin//內盤成交值>設定
     ret=1; 
     end;
  end;
end;