{@type:filter|@guid:3a0b0109807a4e74b512d00200bfd3f2}
//整理=>大漲=>拉回(選股)
setbarfreq("AD");
settotalbar(56);
VALUE5=average(C,5);
VALUE55=average(C,55);
condition1= C>O and C>VALUE55 and trueall(L[1]<VALUE55[1],4);//整理
condition2= C>O and trueall(L>VALUE55,2);//大漲
condition3= C>O and VALUE5[1]<VALUE5[2];//
If C>O and V>100 and GetField("股本(億)","D")<100 and GetField("股本(億)","D")>3
	and condition3 and trueany(condition1,21) and trueany(condition2,13) 
	and V>V[1] and (C[1]<=O[1] or C[2]<=O[2])  
	and C>=(H+L)/2 and C>(H[1]+L[1])/2  and percentr(55)-50>0 
	and lowest(L,5)>Lowest(L,13) and L>lowest(L,5)
then RET=1;