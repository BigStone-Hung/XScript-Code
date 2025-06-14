{@type:indicator|@guid:c4c97aa9a5d046ccbe002b4db496d805}
//3714--------------------------------------------------------------------------------------------------
if GetSymbolField("3714.TW","成交量","D")>GetSymbolField("3714.TW","成交量","D")[1] 
   and GetSymbolField("3714.TW","收盤價","D")>highest(GetSymbolField("3714.TW","最高價","D")[1],3) 
   then begin //3個條件都符合就開始
   value1=GetSymbolField("3714.TW","最低價","D"); //紀錄當根K最低價
end;

if GetSymbolField("3714.TW","收盤價","D") crosses below 
   value1 then begin //跌破紀錄的最低價就標示空方訊號
   value2=-1;
   value90=currentbar;
end;

value91=
countif(GetSymbolField("3714.TW","成交量","D")>GetSymbolField("3714.TW","成交量","D")[1] 
and GetSymbolField("3714.TW","收盤價","D")>highest(GetSymbolField("3714.TW","最高價","D")[1],3),currentbar-value90);

//2393--------------------------------------------------------------------------------------------------
if GetSymbolField("2393.TW","成交量","D")>GetSymbolField("2393.TW","成交量","D")[1] 
   and GetSymbolField("2393.TW","收盤價","D")>highest(GetSymbolField("2393.TW","最高價","D")[1],3) 
   then begin //3個條件都符合就開始
   value3=GetSymbolField("2393.TW","最低價","D"); //紀錄當根K最低價
end;

if GetSymbolField("2393.TW","收盤價","D") crosses below 
   value3 then begin //跌破紀錄的最低價就標示空方訊號
   value4=-1;
   value92=currentbar;
end;

value93=
countif(GetSymbolField("2393.TW","成交量","D")>GetSymbolField("2393.TW","成交量","D")[1] 
and GetSymbolField("2393.TW","收盤價","D")>highest(GetSymbolField("2393.TW","最高價","D")[1],3),currentbar-value92);
   
//2340--------------------------------------------------------------------------------------------------
if GetSymbolField("2340.TW","成交量","D")>GetSymbolField("2340.TW","成交量","D")[1] 
   and GetSymbolField("2340.TW","收盤價","D")>highest(GetSymbolField("2340.TW","最高價","D")[1],3) 
   then begin //3個條件都符合就開始
   value7=GetSymbolField("2340.TW","最低價","D"); //紀錄當根K最低價
end;

if GetSymbolField("2340.TW","收盤價","D") crosses below 
   value7 then begin //跌破紀錄的最低價就標示空方訊號
   value8=-1;
   value96=currentbar;
end;

value97=
countif(GetSymbolField("2340.TW","成交量","D")>GetSymbolField("2340.TW","成交量","D")[1] 
and GetSymbolField("2340.TW","收盤價","D")>highest(GetSymbolField("2340.TW","最高價","D")[1],3),currentbar-value96);

//總計--------------------------------------------------------------------------------------------------

value30=(value2+value91+value4+value93+value6+value95+value8+value97+value10+value99+value12+value101+value14+value103
      +value16+value105+value18+value107+value20+value109+value22+value111+value24+value113);

plot1(value30,"多訊總計");