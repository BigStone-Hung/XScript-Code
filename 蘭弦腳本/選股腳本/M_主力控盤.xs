{@type:filter|@guid:e43c03bca3374f999fc60d18cbd2558c}
//營收創新高_日威廉(選股)
setbarfreq("AD");
settotalbar(100);
variable:I(0);
value21=GetField("主力買張","D")[1]+GetField("控盤者買張","D")[1];
value22=0;
value23=0;
for I = 89 downto 1
 if value21[I]>0 then
 begin
  value22=value22+value21[I];
  value23=value23+(H[I]+L[I]+(O[I]+C[I])/2)/3*value21[I];
 end;
if value22>0 then value24=value23/value22;
If C>O and V>100 and GetField("股本(億)","D")<100 and GetField("股本(億)","D")>3
	and C>value24 and lowest(C[1],2)<lowest(value24[1],2) and average(V,3)>average(V,8) 
	and percentr(55)-50>0 and O>C[54]
	and C>maxlist(average(C,13),average(C,21),average(C,34))
	and lowest(L,21)>lowest(L,55) and lowest(L,8)>=lowest(L,21) then 
ret=1;