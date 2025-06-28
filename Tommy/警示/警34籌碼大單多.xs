{@type:sensor|@guid:4c6e204a41594b06a851e4feeb23166e}
inputs:N1(10,"籌碼N1天新高"),N2(200,"單筆買進N2萬以上");

if symbol="3008.TW" then raiseruntimeerror("刪");

value1=GetField("外資持股")[1];
value2=GetField("投信持股")[1];
value3=GetField("主力持股")[1];
value4=value1+value2+value3;

condition1=value4>highest(value4[1],N1);//籌碼20日新高
condition2=(q_OutSize-q_InSize)>0;//外盤量50%以上
condition3=q_Last>q_AvgPrice;//價格在日均價上
condition4=q_BidAskFlag=1;//外盤成交
condition5=q_TickVolume*close>N2*10;//單筆>200萬

if q_VolumeRatio>1.5 then begin
if condition1 then begin
   
      if condition3 then begin
	     if condition4 and condition5 then ret=1;
	  end;
   
end;
end;