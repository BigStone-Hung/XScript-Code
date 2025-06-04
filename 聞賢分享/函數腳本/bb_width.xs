{@type:function}
SetBarMode(1);//bb_width(close,20,2)
input:price(numeric);
input:length(numeric);
input:BandRange(numeric);

variable: up(0), down(0), mid(0);

up = bollingerband(price, Length, BandRange);
down = bollingerband(price, Length, -1 * BandRange);
mid = ema(price,length);

value1=(up-down)*100/mid; //帶寬 

bb_width=value1; //帶寬


