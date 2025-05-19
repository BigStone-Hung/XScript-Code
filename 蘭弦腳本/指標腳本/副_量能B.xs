{@type:indicator|@guid:be71f3758fb14c9189ebbfc97fee7142}
//分K短線  當沖量能用途
input:plotmode(1,"圖選:", inputkind:=Dict (["分K量",1],["累積量",2],["大單量",3]),quickedit:=true);
VAR:KN(0);
//===========================================
IF DAte<>DAte[1] then 
	begin
		KN=1;
	End
Else
	Begin
		KN=KN+1;
	End;
VALUE21=GetField("成交量", "D")[1];
VALUE31=GetField("買進大單金額")-GetField("賣出大單金額")+GetField("買進特大單金額")-GetField("賣出特大單金額");
//分K量=======================================================
If plotmode=1 then begin
	IF barFreq ="Min" then BEGIN
		Plot11(GetField("成交金額(元)"),"成交金額");
		plot12(average(GetField("成交金額(元)"),KN),"平均金額");
	END;
End;
If plotmode=2 then begin
	IF barFreq ="Min" then BEGIN
		Plot21(summation(V,KN),"累積黃量");
		IF (summation(V,KN-1)[1]<(GetField("成交量", "D")[1]/4) and summation(V,KN)>=(GetField("成交量", "D")[1]/4))
			or (summation(V,KN-1)[1]<(GetField("成交量", "D")[1]/2) and summation(V,KN)>=(GetField("成交量", "D")[1]/2)) then begin
			Plot22(summation(V,KN),"訊號量");
		END;
		Plot23(VALUE99,"累積實量");
		Plot24(VALUE21,"昨日量");
		Plot25(VALUE21/2,"昨半量");
		Plot26(VALUE21/4,"昨半半");
	END;
End;
If plotmode=3 then begin
	IF barFreq ="Min" then BEGIN
		Plot31(summation(VALUE31,KN),"累積大單");
	END;
End;




