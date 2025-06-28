{@type:sensor|@guid:eb61493f0fd0447e961f184904399662}
inputs:sT(090100,"啟動時間");

Vars: Str1("");

if date<>date[1] then begin  //紀錄開盤K棒
value1=currentbar;
end;
value2=highest(GetField("估計量"),currentbar-value1); //畫出今日最大估量

str1=numtostr(GetField("估計量")*close*0.00001,2);//把估量換算成億為單位

if currenttime>sT then begin  //成交值下限及啟動時間
   if GetField("估計量")>highest(GetField("成交量","D"),60) then begin  //估量突破今日最大估量
      if close=q_DailyLow then begin //股價創今高
	  ret=1;
	  RetMsg = str1+"億";	  
	  end;
   end;
end;