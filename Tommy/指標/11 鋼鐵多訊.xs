{@type:indicator|@guid:ccbf01fad3ce440492ed53131082ddec}
//2002--------------------------------------------------------------------------------------------------
if GetSymbolField("2002.TW","成交量","D")>GetSymbolField("2002.TW","成交量","D")[1] 
   and GetSymbolField("2002.TW","收盤價","D")>highest(GetSymbolField("2002.TW","最高價","D")[1],3) 
   then begin //3個條件都符合就開始
   value1=GetSymbolField("2002.TW","最低價","D"); //紀錄當根K最低價
end;

if GetSymbolField("2002.TW","收盤價","D") crosses below 
   value1 then begin //跌破紀錄的最低價就標示空方訊號
   value2=-1;
   value90=currentbar;
end;

value91=
countif(GetSymbolField("2002.TW","成交量","D")>GetSymbolField("2002.TW","成交量","D")[1] 
and GetSymbolField("2002.TW","收盤價","D")>highest(GetSymbolField("2002.TW","最高價","D")[1],3),currentbar-value90);

//2027--------------------------------------------------------------------------------------------------
if GetSymbolField("2027.TW","成交量","D")>GetSymbolField("2027.TW","成交量","D")[1] 
   and GetSymbolField("2027.TW","收盤價","D")>highest(GetSymbolField("2027.TW","最高價","D")[1],3) 
   then begin //3個條件都符合就開始
   value3=GetSymbolField("2027.TW","最低價","D"); //紀錄當根K最低價
end;

if GetSymbolField("2027.TW","收盤價","D") crosses below 
   value3 then begin //跌破紀錄的最低價就標示空方訊號
   value4=-1;
   value92=currentbar;
end;

value93=
countif(GetSymbolField("2027.TW","成交量","D")>GetSymbolField("2027.TW","成交量","D")[1] 
and GetSymbolField("2027.TW","收盤價","D")>highest(GetSymbolField("2027.TW","最高價","D")[1],3),currentbar-value92);
   
//5009--------------------------------------------------------------------------------------------------
if GetSymbolField("5009.TW","成交量","D")>GetSymbolField("5009.TW","成交量","D")[1] 
   and GetSymbolField("5009.TW","收盤價","D")>highest(GetSymbolField("5009.TW","最高價","D")[1],3) 
   then begin //3個條件都符合就開始
   value5=GetSymbolField("5009.TW","最低價","D"); //紀錄當根K最低價
end;

if GetSymbolField("5009.TW","收盤價","D") crosses below 
   value5 then begin //跌破紀錄的最低價就標示空方訊號
   value6=-1;
   value94=currentbar;
end;

value95=
countif(GetSymbolField("5009.TW","成交量","D")>GetSymbolField("5009.TW","成交量","D")[1] 
and GetSymbolField("5009.TW","收盤價","D")>highest(GetSymbolField("5009.TW","最高價","D")[1],3),currentbar-value94);

//總計--------------------------------------------------------------------------------------------------

value30=(value2+value91+value4+value93+value6+value95+value8+value97+value10+value99+value12+value101+value14+value103
      +value16+value105+value18+value107+value20+value109+value22+value111+value24+value113);

plot1(value30,"多訊總計");