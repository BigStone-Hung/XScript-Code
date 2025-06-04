{@type:indicator|@guid:c81c8d8394e740b493805f497964aa45}
settotalBar(900);
variable: up1(0), down1(0), mid1(0);
variable: up2(0), down2(0), mid2(0);

value1=getField("融資維持率");
up1 = bollingerband(value1, 20, 2);
down1 = bollingerband(value1, 20, -2);
if up1 - down1 = 0 then value11 = 0 
else value11 = (value1 - down1) * 100 / (up1 - down1);

value2=GetField("殖利率", "D");
up2 = bollingerband(value2, 20, 2);
down2 = bollingerband(value2, 20, -2);
if up2 - down2 = 0 then value12 = 0 
else value12 = (value2 - down2) * 100 / (up2 - down2);

value4=value12-value11;
PLOT1(75,"基準線");
PLOT2(VALUE4,"殖利率-維持率%bdif");
PLOT3(-75,"-基準線");