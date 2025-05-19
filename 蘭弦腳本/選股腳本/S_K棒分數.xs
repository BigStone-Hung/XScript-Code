{@type:filter|@guid:3a53e8fa95ff43d992ac1573b395243c}
setbarfreq("AD");
settotalBar(14);
Value1=countif(C>H*0.99 and H>L*1.02 and C>C[1],13);
Value2=countif(C<L*1.01 and H>L*1.02 and C<C[1],13);
VALUE3=Value1-Value2;
IF Value3>=5 and V<CALL_BV*1.5 
	and (highest(H,13)-Lowest(L,13))/Lowest(L,13)<0.21 
	then RET=1;
outputfield1(value3,"技術分數");