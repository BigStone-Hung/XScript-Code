{@type:sensor|@guid:523d7c37594b4d18bb36577ed6cec918}
input: BigBuy(300,"大戶買單(萬)");
input: bigbuyratio(30,"大戶買單比例下限%");
variable: intrabarpersist Xvolume(0);//累計大戶買單
variable: intrabarpersist Volumestamp(0);
 
Volumestamp =q_DailyVolume; 
 
if Date <> currentdate or Volumestamp = Volumestamp[1] then Xvolume =0; //開盤那根要歸0
 
if q_tickvolume*q_Last > BigBuy*10 and q_BidAskFlag=1 then Xvolume=Xvolume[1]+q_tickvolume; //量夠大就加到累計大戶買單
 
if volumestamp >=1000 then begin //主力買超1000萬以上
if Xvolume/volumestamp*100> bigbuyratio then ret=1; //主力買超佔當日總量30%以上
end;