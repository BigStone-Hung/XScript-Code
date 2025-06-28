{@type:sensor|@guid:36b98965c0c14da39664a207d0ea89d8}
Value1 = Month(date);
if value1<>value1[1] then value2=currentbar;
value3=currentbar-value2+1;
value4=xaverage(close,value3);

if value4>value4[2] then begin
   if low[1]<value4 and low>value4 then ret=1;
end;