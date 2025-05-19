{@type:filter}
//週線選股排除法
SETBARFreq("AW");
SETTOTALBar(3);
Condition1=GetField("現股當沖張數", "W")>CALL_BV;
Condition2= trueAll(GetField("月營收", "M")<GetField("月營收", "M")[1],2);
IF trueAny(Condition1[1] or Condition2,2) then ret=1; 
	
