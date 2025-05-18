{@type:function}
Var:I(0);
value1=GetField("融資買進張數")[1];
value2=0;
value3=0;
for I = 12 downto 0
 begin
  value2=value2+value1[I];
  value3=value3+(H[I]+L[I]+(O[I]+C[I])/2)/3*value1[I];
 end;
if value2>0 then Call_MB=value3/value2;