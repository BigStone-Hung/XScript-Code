{@type:sensor|@guid:ac3986b09110497090a8187de17d5baa}
if q_PriceChangeRatio cross Above 3 then begin
ret=1;
retmsg="+3%";
end;

if q_PriceChangeRatio cross Above 5 then begin
ret=1;
retmsg="+5%";
end;

if q_PriceChangeRatio cross below 3 then begin
ret=1;
retmsg="-3%";
end;

if q_PriceChangeRatio cross below 5 then begin
ret=1;
retmsg="-5%";
end;