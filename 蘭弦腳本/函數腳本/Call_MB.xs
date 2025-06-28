{@type:function|@guid:d4c775e0134b4e0897501da066efeefd}
Var:I(0);
value1=GetField("融資買進張數")[1];
value2=0;value3=0;
value12=0;value13=0;
for I = 12 downto 0
 begin
  value2=value2+value1[I];
  value3=value3+(H[I]+L[I]+(O[I]+C[I])/2)/3*value1[I];
  If I<=7 then begin
	  value12=value12+value1[I];
	  value13=value13+(H[I]+L[I]+(O[I]+C[I])/2)/3*value1[I];
  End;
 end;
if value2>0 and value12>0 then Call_MB=((value3/value2)+(value13/value12))/2;