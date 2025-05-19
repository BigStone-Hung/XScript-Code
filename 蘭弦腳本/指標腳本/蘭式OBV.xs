{@type:indicator|@guid:9ff76c192be7423ead6e301ebd8917be}
variable: obvolume(0);
if CurrentBar = 1 then
	obvolume = 0
else
  begin	
	if close > close[1] then
		obvolume = obvolume[1] + volume
	else
	  begin
		if close < close[1] then
			obvolume = obvolume[1] - volume
		else
			obvolume = obvolume[1];
	  end;		
  end;
condition1=obvolume=highest(obvolume,55);
condition2=obvolume=lowest(obvolume,34);
IF condition1 and not(trueAny(condition1[1],13)) then begin
	value1=obvolume;
	IF value1>value1[55] then VALUE2=obvolume else VALUE2=0;
	IF value1<value1[55] then VALUE3=obvolume else VALUE3=0;
End;
IF condition2 and not(trueAny(condition1[1],8)) then begin
	value1=obvolume;
	IF value1>value1[34] then VALUE2=obvolume else VALUE2=0;
	IF value1<value1[34] then VALUE3=obvolume else VALUE3=0;
End;
VALUE4=MAXList(VALUE2,VALUE3);
condition1=value4[1]=value4[2] and value4[0]>value4[1];
IF CONDITION1 and H<highest(H,55) and AVERAGE(C,13)>AVERAGE(C,13)[1] then VALUE5=obvolume/2 else VALUE5=0;
Plot1(obvolume,"標準OBV");
Plot2(VALUE4,"柱圖",checkbox:=1);
Plot3(VALUE5,"訊號",checkbox:=1);
