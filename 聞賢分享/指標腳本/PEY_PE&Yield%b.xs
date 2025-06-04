{@type:indicator|@guid:9e3c243af98b422d8e7cf39a6c94e6b2}
settotalBar(1200);
variable: up1(0), down1(0), mid1(0);
variable: up2(0), down2(0), mid2(0);

value1=GetField("本益比","d");
up1 = bollingerband(value1, 20, 2);
down1 = bollingerband(value1, 20, -2);
if up1 - down1 = 0 then value11 = 0 
   else value11 = (value1 - down1) * 100 / (up1 - down1);

value2=GetField("殖利率", "D");
up2 = bollingerband(value2, 20, 2);
down2 = bollingerband(value2, 20, -2);
if up2 - down2 = 0 then value12 = 0 
   else value12 = (value2 - down2) * 100 / (up2 - down2);

value4=value12-value11;  //%b_DIF

//PLOT1(75,"上基準線");
PLOT2(value4,"%b高殖");
//PLOT3(-75,"下基準線");