{@type:filter|@guid:f18dc59944f34ec6b4c0e0a356644a1d}
//週線選股基本判斷
SETBARFreq("AW");
SETTOTALBar(56);
Condition1=GetField("大戶持股比例", "W", param := 400)>GetField("大戶持股比例", "W", param := 400)[1] and GetField("散戶持股比例", "W", param := 400)<GetField("散戶持股比例", "W", param := 400)[1];
condition2=(highest(H,3)-lowest(L,3))/lowest(L,3)<0.34;
IF GetField("收盤價", "D")>Lowest(GetField("開盤價", "D"),3) 
	and Condition1 and Condition2 then ret=1; 
	
