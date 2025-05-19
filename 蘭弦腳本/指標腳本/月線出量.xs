{@type:indicator|@guid:cc27c729744140438752b8bba884d924}
input:plotmode(1,"主副圖:", inputkind:=Dict (["主圖",1],["損益",2],["副圖",3]),quickedit:=true);
VALUE1=(HIGHEST(H,5)-LOWEST(L,5))/LOWEST(L,5);
condition1=C>O and V=HIGHEST(V,8) and VALUE1[1]<0.34 and not(C[1]>O[2] and C[2]>O[2]) 
			and TRUEANY(C[1]<=O[1],3) and C>O[1] and V[1]<V[2] and V[1]>L[2];
IF plotmode=1 then begin
	IF condition1 THEN PLOT1(L);
End;
IF plotmode=3 then begin
	//PLOTK(GetField("月營收", "M"));
End;