{@type:filter|@guid:87689c13d9e3480ead2451a1aa75c5bc}
//月線選股排除法
setbarfreq("M");
settotalbar(5);
IF GetField("月營收","M")=lowest(GetField("月營收","M"),3) then	ret=1;	

