{@type:filter|@guid:da6c3ff6ff514a569dae0ccd398943ae}
setbarfreq("AD");
settotalbar(89);
value1=iff(GetField("總持股人數")<>0,
(GetField("大戶持股張數",param := 400)+GetField("散戶持股張數",param := 400))/GetField("總持股人數"),
(GetField("大戶持股張數",param := 400)[1]+GetField("散戶持股張數",param := 400)[1])/GetField("總持股人數")[1]);
value2=value1*C;
//============================
condition1=C<Highest(C[5],21) and value2=highest(value2,55);
CONDITION2=(Highest(H,21)-lowest(L,21))/lowest(L,21)<0.34;
//=================================================
//PLOT1(value2*1000,"集保金額");
value3=highest(value2[1],55);
//plot2(value3*1000,"背離線");	
If (C>O and condition1 and condition2) and GetField("累計營收年增率", "M")>0  and H<>HIGHEST(H,8) then begin 
	RET=1;//plot3(0,"訊號A");
End;
{If (value2>value3 and value2[1]<value3[1]) then begin 
	RET=1;//plot4(0,"訊號B");
End;}