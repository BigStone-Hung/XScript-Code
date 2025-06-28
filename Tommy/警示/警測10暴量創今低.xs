{@type:sensor|@guid:31f849d767e245f8977dd2839ba26d54}
inputs:EV(10,"估量下限(億)"),sT(090600,"啟動時間");

Vars: Str1("");

if date<>date[1] then begin  //紀錄開盤K棒
value1=currentbar;
end;
value2=highest(GetField("估計量"),currentbar-value1); //畫出今日最大估量

str1=numtostr(GetField("估計量")*close*0.00001,2);//把估量換算成億為單位

if currenttime>sT and (GetField("估計量")*close*0.00001)>EV and GetField("量比")>1 then begin  //成交值下限及啟動時間
   if GetField("估計量")>GetField("估計量")[1] then begin  //估量突破今日最大估量
      if close=q_DailyLow then begin //股價創今高
	  ret=1;
	  RetMsg = str1+"億";	  
	  end;
   end;
end;