{@type:sensor|@guid:9121b39b62f04cf8b2dd62dc9caa541d}

input:days(60,"計算期間");
input:M1(200,"最低買超張數");
value1=getField("外資買賣超", "D");
value2=getField("投信買賣超", "D");
condition1=value1>m1 and value2>m1;

if TrueAny(condition1 and barslast(condition1)[1]>=days,10)
then ret=1;