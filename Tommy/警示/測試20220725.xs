{@type:sensor|@guid:a6894b3bf11a4891aeb98b8bbc9051f9}
inputs:period(5);
value1=getfield("內盤量");
value2=getfield("外盤量");
if value1<>0 then value3=value2-value1;

value4=summation(value3,period);

if (value4[1]-value4[2])>1 then begin
   ret=1;
   retmsg="買盤";
   Print(File("C:\Users\Administrator\Desktop\test20220725.txt"), date,time,symbol,close,value4[1]-value4[2]);
   end;

if (value4[1]-value4[2])<-1 then begin
   ret=1;
   retmsg="賣盤";
   Print(File("C:\Users\Administrator\Desktop\test20220725.txt"), date,time,symbol,close,value4[1]-value4[2]);
   end;   