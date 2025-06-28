{@type:sensor|@guid:f85f1b90607a44bf85bc5e93fd194d0d}
inputs:P1(50,"price >"),P2(300,"price <"),V1(300,"day volume");

if close>P1 and close<P2 then begin
   if GetField("成交量","D")>V1 and GetField("成交量","D")>GetField("成交量","D")*1.5 then begin 
   if EMA(close,20)>EMA(close,100) then begin
      if currenttime>133500 then begin
      if close cross above EMA(close,20) then ret=1;
      end;
   end;
   end;
end;
