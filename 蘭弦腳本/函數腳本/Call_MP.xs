{@type:function}
Var:I(0);
value1=GetField("主力買張","D")[1]+GetField("控盤者買張","D")[1];
value2=0;
value3=0;
for I = 89 downto 1
 begin
  value2=value2+value1[I];
  value3=value3+(H[I]+L[I]+(O[I]+C[I])/2)/3*value1[I];
 end;
if value2>0 then Call_MP=value3/value2;