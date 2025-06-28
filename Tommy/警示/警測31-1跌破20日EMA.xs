{@type:sensor|@guid:a484405a539c4d71ace26c5d2e99d52a}
inputs:P1(50,"price >"),P2(300,"price <"),V1(300,"day volume");

if close>P1 and close<P2 then begin
   if GetField("成交量","D")>V1 then begin 
   if EMA(close,20)<EMA(close,100) then begin
      //if currenttime>133500 then begin
      if close cross below EMA(close,20) then ret=1;
      //end;
   end;
   end;
end;
