{@type:filter|@guid:fe760c9a71ca4c9aa5747fdba8c06d10}
{權證小哥上下布林選股}

settotalbar(30);
value1=BollingerBand(Close,20,2);       //計算20期、2個標準差寬的包寧傑通道上限
value2=BollingerBand(Close,20,-2);      //計算20期、2個標準差寬的包寧傑通道下限
value3=average(v,20);      //計算20日均量              
value4=average(c,20);      //計算收盤價20日均價=20日均線

if value2[1] <>0 and v>value3*2 and value4>value4[1] then 
begin
if (value1[1]-value2[1])/value2[1]<=0.05 and value1>value1[1] then 
     //帶寬窄，則可以配合籌碼做趨勢突破，這邊取昨天的值壓縮，且今天上布林翹起
  begin
     if C>value1 then ret=1;
  end;
end;  

