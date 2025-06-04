{@type:indicator|@guid:de5cd198e32d46dfbbb64e4015b86d2e}
variable: up1(0), down1(0), mid1(0);

value1=GetField("殖利率", "D");

up1 = bollingerband(value1, 20, 2);
down1 = bollingerband(value1, 20, -2);
if up1 - down1 = 0 then value16 = 0 else value16 = (value1 - down1) * 100 / (up1 - down1);

if value1<>0 then value2=c/value1;

PLOT1(VALUE16,"殖利率%b");
