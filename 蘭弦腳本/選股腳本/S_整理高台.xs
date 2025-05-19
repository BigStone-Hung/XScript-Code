{@type:filter|@guid:6685ff88c669496ebc56e937ad99ddec}
setbarfreq("AD");
settotalbar(56);

VALUE1=(H-L)/C;
value11=maxlist(O,C)-minlist(O,C);
value12=value11/((H+L)/2);

value21=rateofchange(close,55);
value22=rateofchange(close,34);
value23=value21+value22;
value24=xaverage(value23,8);

condition1=(average(VALUE1,8)<average(VALUE1,21) or average(VALUE1,5)<average(VALUE1,13)) and C*(1-average(VALUE1,8))>highest(H,55)*.92 ;
condition2=average(value12,8)<average(value12[7],8);
condition3=average(value12,3)<average(value12[2],3);
condition4=lowest(L,21)>lowest(L,55) and H<highest(H,10);
condition5=average(C,5)<average(C[4],5);

IF V>V[1] and V<V[1]*2 and H>H[1] and trueall(condition1,5) and C>O and C<highest(H[1],8) and percentr(55)-50>0 and C>C[54]
and Lowest(L,5)>Lowest(L,13) and Lowest(L,21)>Lowest(L,55) and value24>value24[1]
then ret=1;

If C>O and V>100 and GetField("股本(億)","D")<100 and GetField("股本(億)","D")>3
	and condition2 and condition3 and condition4 and condition5 
	and average(C[7],8)>average(C[8],8) and percentr(55)-50>0 and C>C[54] and value24>value24[1]
	and V>V[1] and V<V[1]*2 and C>O 
then ret=1;
