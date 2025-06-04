{@type:indicator|@guid:aaf3ef95493a4ea6a98aa852bc9471d0}
input: Length(5);	SetInputName(1, "均線天期");
input: Length1(20);	SetInputName(1, "均線天期");
input: BandRange(2);SetInputName(2, "上下寬度");
variable: up(0), down(0), mid(0);

settotalBar(300);
variable:count(0);

value1=getfield("外盤量");
value2=getfield("內盤量");

value3=summation(value1,Length);
value4=summation(value2,Length);
if value4<>0 then 
value5=value3/value4;  //外盤動能比

up = bollingerband(value5, Length1, BandRange);
down = bollingerband(value5, Length1, -1 * BandRange);
if up - down = 0 then value7 = 0 else value7 = (value5 - down) * 100 / (up - down);

plot1(value7,"外盤動能比%b");


