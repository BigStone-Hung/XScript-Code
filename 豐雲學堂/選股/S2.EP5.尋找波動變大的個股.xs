{@type:filter|@guid:482dc2ce55cd44edb48e77eb024c9772}

if close > open then
value1=close-open
else value1=open-close;

value2=average(value1,20);
value3=bollingerBand(value1,20,1);

ret=value1 cross over value3 and getfield("投信買賣超", "D")>0;