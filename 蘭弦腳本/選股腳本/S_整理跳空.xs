{@type:filter|@guid:4830e56861d14566a6dc25e4513e8642}
SETTOtalBar(15);
Condition1=L>MAXList(O[1],C[1])*1.01 and C>O and O<=Highest(H[1],13) ;
Condition2=(V>V[2] or V[1]>V[2]);
IF CONdition1 and Condition2
	and not(trueAny(CONdition1[1],3)) then begin
	RET=1;
END;