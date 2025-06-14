{@type:indicator|@guid:cb23d12f075c44d8be75c88f176a793b}
//3008--------------------------------------------------------------------------------------------------
if GetSymbolField("3008.TW","成交量","D")>GetSymbolField("3008.TW","成交量","D")[1] 
   and GetSymbolField("3008.TW","收盤價","D")>highest(GetSymbolField("3008.TW","最高價","D")[1],3) 
   then begin //3個條件都符合就開始
   value1=GetSymbolField("3008.TW","最低價","D"); //紀錄當根K最低價
end;

if GetSymbolField("3008.TW","收盤價","D") crosses below 
   value1 then begin //跌破紀錄的最低價就標示空方訊號
   value2=-1;
   value90=currentbar;
end;

value91=
countif(GetSymbolField("3008.TW","成交量","D")>GetSymbolField("3008.TW","成交量","D")[1] 
and GetSymbolField("3008.TW","收盤價","D")>highest(GetSymbolField("3008.TW","最高價","D")[1],3),currentbar-value90);

//3406--------------------------------------------------------------------------------------------------
if GetSymbolField("3406.TW","成交量","D")>GetSymbolField("3406.TW","成交量","D")[1] 
   and GetSymbolField("3406.TW","收盤價","D")>highest(GetSymbolField("3406.TW","最高價","D")[1],3) 
   then begin //3個條件都符合就開始
   value3=GetSymbolField("3406.TW","最低價","D"); //紀錄當根K最低價
end;

if GetSymbolField("3406.TW","收盤價","D") crosses below 
   value3 then begin //跌破紀錄的最低價就標示空方訊號
   value4=-1;
   value92=currentbar;
end;

value93=
countif(GetSymbolField("3406.TW","成交量","D")>GetSymbolField("3406.TW","成交量","D")[1] 
and GetSymbolField("3406.TW","收盤價","D")>highest(GetSymbolField("3406.TW","最高價","D")[1],3),currentbar-value92);
   
//3019--------------------------------------------------------------------------------------------------
if GetSymbolField("3019.TW","成交量","D")>GetSymbolField("3019.TW","成交量","D")[1] 
   and GetSymbolField("3019.TW","收盤價","D")>highest(GetSymbolField("3019.TW","最高價","D")[1],3) 
   then begin //3個條件都符合就開始
   value5=GetSymbolField("3019.TW","最低價","D"); //紀錄當根K最低價
end;

if GetSymbolField("3019.TW","收盤價","D") crosses below 
   value5 then begin //跌破紀錄的最低價就標示空方訊號
   value6=-1;
   value94=currentbar;
end;

value95=
countif(GetSymbolField("3019.TW","成交量","D")>GetSymbolField("3019.TW","成交量","D")[1] 
and GetSymbolField("3019.TW","收盤價","D")>highest(GetSymbolField("3019.TW","最高價","D")[1],3),currentbar-value94);

//總計--------------------------------------------------------------------------------------------------

value30=(value2+value91+value4+value93+value6+value95);

plot1(value30,"多訊總計");