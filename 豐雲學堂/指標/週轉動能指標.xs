{@type:indicator}
Input: aa(10,"短周期");
Input: bb(20,"中周期");
Input: cc(60,"長周期");



plot3(turnoverRate(aa),"短周轉率");
plot2(turnoverRate(bb),"中周轉率");
plot1(turnoverRate(cc),"長周轉率");

condition1 = ( turnoverRate(aa) cross over turnoverRate(bb) ) and (turnoverRate(bb)>turnoverRate(cc));



if turnoverRate(bb)>2 and getField("Volume","D")[1]>2000 then
begin
if condition1 then plot99(turnoverRate(aa),"突破") ;
end;