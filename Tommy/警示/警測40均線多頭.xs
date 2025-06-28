{@type:sensor|@guid:e5c959f1ae9b41ee94294badd3cce526}
value1=average(close,5);
value2=average(close,20);
value3=average(close,60);

if value1>value2 and value2>value3 then begin
  if value1>value1[2] and value2>value2[2] and value3>value3[2]
  then ret=1;
end;