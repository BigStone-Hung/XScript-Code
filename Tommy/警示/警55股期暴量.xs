{@type:sensor|@guid:7f14e36357ce467d86356aa931e11710}
//1500期內，最高成交量
value1=highest(volume,1500);

if volume>200 and volume>value1[1]
{
成交量大於200
成交量大於1500期內最大成交量
}
then ret=1;
