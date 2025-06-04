{@type:indicator|@guid:d7c2f850c0ac4924b7bb35830ea0e97a}
//input: enddate(20221231,"結束日");
//if CurrentDate>=enddate then RaiseRunTimeError("1");
//.....................................................................................
if 	K1B_ScoreWB(5,5,5) then    
    plot1(low, "entry") else

if 	K1B_ScoreWS(5,5,5) then 
	plot2(high, "exit");