{@type:filter|@guid:189193276a224c119434ab8c2e5e5a05}
setbarfreq("AD");
settotalbar(56);
variable:MKP(0),PLine(0),ULine(0),DLine(0),JUCount(0),JDCount(0),KN(0);
//========================================================
value32=average(C,5);
value33=(H-L)/((O+C)/2);
value34=average(value33,55);
value35=average(C,5)*(1+value34);
value36=average(C,5)*(1-value34);
Condition1=L>maxlist(O[1],C[1]) and (C>(H+L)/2 or C>O or L>H[1]) and V>V[1];//and lowest(L[1],5)=lowest(L[1],13)
Condition2=H<minlist(O[1],C[1]) and (C<(H+L)/2 or C<O or H<L[1]) ;//and highest(H[1],5)=highest(H[1],13)
IF Condition1 then begin
	JUCount=JUCount+1;	
	If JUCount=1 then begin
		//plot11(C,"上躍");
	End;
	PLine=L[1];
	JDCount=0;
End;
If condition2 then begin
	JDCount=JDCount+1;	
	If JDCount=1  then begin
		//plot12(H,"跳下");
		VALUE22=maxlist(O[1],C[1]);
		KN=0;
	End;
	IF JDCount>=0 then DLine=H[1];
	JUCount=0;	
End;
KN=KN+1;
If C>O and C>(H+L)/2 and V>100 and GetField("股本(億)","D")<100 and GetField("股本(億)","D")>3
	and JUCount=1 and JUCount[1]=0 and C>VALUE22 and minlist(O[1],C[1])<value22 and H[1]<highest(H[1],21) and KN<13 and value32[1]>value32[2]
then ret=1;






