{@type:filter|@guid:5edf4d2dc82d4752b4e1405ba1cd7c51}
setbarFreq("AD");
SETTOtalBar(2);
condition1= GetField("減資日期")>Date or GetField("現增繳款日期")>Date
			or GetField("除息日期")>Date or GetField("除權日期")>Date
			or GetField("法說會日期")>Date or GetField("股東會日期")>Date //or GetField("最後過戶日期")>Date
			or GetField("庫藏股結束日期")>Date;
If condition1 then RET=1;
outputfield1(GetSymbolInfo("WithConvertibleBond"),"有CB");
outputfield2(Iff(GetField("減資日期")>Date,GetField("減資日期"),0),"減資日期");
outputfield3(Iff(GetField("現增繳款日期")>Date,GetField("現增繳款日期"),0),"現增日期");
outputfield4(Iff(GetField("除息日期")>Date,GetField("除息日期"),0),"除息日期");
outputfield5(Iff(GetField("除權日期")>Date,GetField("除權日期"),0),"除權日期");
outputfield6(Iff(GetField("法說會日期")>Date,GetField("法說會日期"),0),"法說會日期");
outputfield7(Iff(GetField("股東會日期")>Date,GetField("股東會日期"),0),"股東會日期");
outputfield8(GetField("庫藏股開始日期"),"庫藏股開始日期");
outputfield9(Iff(GetField("庫藏股結束日期")>Date,GetField("庫藏股結束日期"),0),"庫藏股結束日期");


