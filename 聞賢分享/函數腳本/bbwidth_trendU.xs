{@type:function_bool|@guid:f870801278ac46edae1cb0dc10b809de}
SetBarMode(1);//bb_width1(close,20,2)
input:price(numeric);
input:length(numeric);
input:BandRange(numeric);

variable: up(0), down(0), mid(0);

up = bollingerband(price, Length, BandRange);
down = bollingerband(price, Length, -1 * BandRange);
mid = ema(price,length);
if mid<>0 then
value1=(up-down)*100/mid; //帶寬 

bbwidth_trendU=value1>value1[1] and c>mid; //帶寬指標趨勢U