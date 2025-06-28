{@type:sensor|@guid:f7d6176242bb4a088c179f58cfe05fc7}
value1=BollingerBand(Close,20,-2);
value2=countif(low[1]<value1[1],5);

if low<value1 then begin
value3=currentbar;
end;

if value2=1 then begin//5日內跌破布林下軌1次
   if (currentbar-value3)<5 then begin//跌破下軌後不超過5日
      if close>low[currentbar-value3]*1.05 then ret=1;//自下軌低點反彈5%
   end;
end;
