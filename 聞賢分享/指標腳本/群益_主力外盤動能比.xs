{@type:indicator|@guid:2727dbf78dae4ce595d62ee30c2c2e5e}
input: Length(5); SetInputName(1, "分鐘數");
input: Length1(8); SetInputName(2, "平滑分鐘數");
input: Length2(5); SetInputName(3, "主力參數");
input: Length3(5);SetInputName(4, "平滑分鐘數");

variable:bid1(0),ask1(0);
variable: up(0), down(0), mid(0);
settotalbar(300);

if c>c[1] or (c=c[1] and c[1]>c[2]) or (c=c[1] and c[1]=c[2] and c[2]>c[3]) 
or (c=c[1] and c[1]=c[2] and c[2]=c[3] and c[3]>c[4])
or (c=c[1] and c[1]=c[2] and c[2]=c[3] and c[3]=c[4] and c[4]>c[5])
or (c=c[1] and c[1]=c[2] and c[2]=c[3] and c[3]=c[4] and c[4]=c[5] and c[5]>c[6])
or (c=c[1] and c[1]=c[2] and c[2]=c[3] and c[3]=c[4] and c[4]=c[5] and c[5]=c[6] and c[6]>c[7])
or (c=c[1] and c[1]=c[2] and c[2]=c[3] and c[3]=c[4] and c[4]=c[5] and c[5]=c[6] and c[6]=c[7] and c[7]>c[8])
or (c=c[1] and c[1]=c[2] and c[2]=c[3] and c[3]=c[4] and c[4]=c[5] and c[5]=c[6] and c[6]=c[7] and c[7]=c[8] and c[8]>c[9])
or (c=c[1] and c[1]=c[2] and c[2]=c[3] and c[3]=c[4] and c[4]=c[5] and c[5]=c[6] and c[6]=c[7] and c[7]=c[8] and c[8]=c[9] and c[9]>c[10])
then ask1=v else ask1=0;

if c<c[1] or (c=c[1] and c[1]<c[2]) or (c=c[1] and c[1]=c[2] and c[2]<c[3]) 
or (c=c[1] and c[1]=c[2] and c[2]=c[3] and c[3]<c[4])
or (c=c[1] and c[1]=c[2] and c[2]=c[3] and c[3]=c[4] and c[4]<c[5])
or (c=c[1] and c[1]=c[2] and c[2]=c[3] and c[3]=c[4] and c[4]=c[5] and c[5]<c[6])
or (c=c[1] and c[1]=c[2] and c[2]=c[3] and c[3]=c[4] and c[4]=c[5] and c[5]=c[6] and c[6]<c[7])
or (c=c[1] and c[1]=c[2] and c[2]=c[3] and c[3]=c[4] and c[4]=c[5] and c[5]=c[6] and c[6]=c[7] and c[7]<c[8])
or (c=c[1] and c[1]=c[2] and c[2]=c[3] and c[3]=c[4] and c[4]=c[5] and c[5]=c[6] and c[6]=c[7] and c[7]=c[8] and c[8]<c[9])
or (c=c[1] and c[1]=c[2] and c[2]=c[3] and c[3]=c[4] and c[4]=c[5] and c[5]=c[6] and c[6]=c[7] and c[7]=c[8] and c[8]=c[9] and c[9]<c[10])
then bid1=v else bid1=0;

value1=summation(ask1,Length);  //外盤量
value2=summation(bid1,Length);  //內盤量

if (value1+value2)<>0 then
begin 
if((value1-value2)*100/(value1+value2))> Length1 then
value3=value1-value2 else value3=0;  //主力外盤量
if((value2-value1)*100/(value1+value2))> Length1 then
value4=value2-value1 else value4=0;  //主力內盤量
end;
value5=average(value3,Length2); //主力外盤量ma5
value6=average(value4,Length2); //主力內盤量ma5
if value5<>0 then 
value7=value6/value5; //主力內盤比
value8=average(value7,Length3);

value15=average(value3,Length2);
value16=average(value4,Length2);
if value16<>0 then 
value17=value15/value16; //主力外盤比
value18=average(value17,Length3);
//
Plot1(value17, "主力外盤比");
plot2(value18, "主力外盤比MA5");