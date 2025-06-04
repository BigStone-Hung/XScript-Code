{@type:indicator|@guid:52c866f9d0c34ea5858cf4fcccc2b1d6}
settotalBar(900);
variable: up1(0), down1(0), mid1(0);
variable: up2(0), down2(0), mid2(0);

value1=getField("融資維持率");
up1 = bollingerband(value1, 20, 2);
down1 = bollingerband(value1, 20, -2);
if up1 - down1 = 0 then value11 = 0 else value11 = (value1 - down1) * 100 / (up1 - down1);

value2=GetField("殖利率", "D");
up2 = bollingerband(value2, 20, 2);
down2 = bollingerband(value2, 20, -2);
if up2 - down2 = 0 then value12 = 0 else value12 = (value2 - down2) * 100 / (up2 - down2);

value3=((100-value11)+(value12))/2;

PLOT1(VALUE11,"維持率%b");