{@type:sensor|@guid:271fccdf38554ca0a56ca61f4cc23cf0}
// XQ: DMI指標
variable: pdi_value(0), ndi_value(0), adx_value(0);
DirectionMovement(15, pdi_value, ndi_value, adx_value);
// 初始區波動較大, 先不繪出
//
if CurrentBar < 15 then
 begin
	pdi_value = 0;
	ndi_value = 0;
	adx_value = 0;
 end;
//新價線 
 if countif(close>close[1],3)=3 then begin
value1=close[3];
end;
value2=(close-value1);

//警示條件
if value2>0 then begin
   if pdi_value[1] cross above ndi_value then ret=1;
end;