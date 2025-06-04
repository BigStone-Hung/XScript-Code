{@type:function}
// 外資多空
setbarmode(1);
input:Length(numeric,"計算天數");
input:LowLimit(numeric,"外資買超天數");

if countif(GetField("外資買賣超")> 0,Length) >= LowLimit
and GetField("外資買賣超")> 0 then
	value1 = 1
else
	value1 = 0;
Foreign_TBS=value1;	