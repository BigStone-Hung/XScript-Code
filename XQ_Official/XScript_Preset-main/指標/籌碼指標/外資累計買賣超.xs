{@type:indicator}
input: Length(5,"計算天數");
input:TXT("僅適用日線以上"); setinputname(2,"使用限制");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
variable: _buyTotal(0), volTotal(0), _Ratio(0);

_buyTotal = summation(GetField("外資買賣超"), Length);
volTotal = summation(Volume, Length);

if volTotal <> 0 then
	_Ratio = _buyTotal * 100 / volTotal
else
	_Ratio = 0;

Plot1(_buyTotal, "累計買賣超");
Plot2(_Ratio, "比例%");
