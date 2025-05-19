{@type:filter|@guid:6a48fd60d64143f98649928c7da83051}
//日線選股排除法
setBarFreq("AD");
settotalBar(90);
condition11=C>300
				or GetField("股本(億)", "D")<3
				or average(GetField("現股當沖張數","D")/V,3)>0.618 
				or GetField("成交金額(元)", "D")<30000000 
				or GetField("週轉率", "D")<0.3
				or RIGhtStr(SYmbolName,2)="KY" 
				//or leftstr(symbol,2)="28" or leftstr(symbol,2)="58" or leftstr(symbol,2)="60" 
				or H<L[1]
				or trueAny(O<C and H<minlist(O[1],C[1]),3)
				or trueCount(H=highest(H,34),8)>=5
				or (average(C,8)<average(C,8)[1] and average(C,21)<average(C,21)[1] and average(C,55)<average(C,55)[1])
				or (highest(V,3)=highest(V,55) and Highest(H,3)=Highest(H,55) and highest(V,3)>highest(Call_BV,3)*2)
				or CALL_55W<0
				or C<CALL_MP
				or ((BIas(8)+BIas(21)+BIas(55))/3)>13
				or (highest(H,3)-lowest(L,5))/lowest(L,5)>0.21
				or trueany(H/L[1]>1.16,3)
				or (L=lowest(L,3) and C=lowest(C,3))
				or C>GetField("參考價", "D")*1.09
				or highest(V,8)>Lowest(V,8)*13
				or GetField("當日沖銷張數")>CALL_BV
				or (CALL_BV<CALL_BV[1]+1 and V<V[1])
				or H=GetField("漲停價", "D")
				or trueAny(BIas(13)>8,5)
				;
If condition11 then begin
	//If condition11 or condition12 or condition13 or condition14 or condition15 or condition16 or trueAny(condition17,5) or trueAny(condition18,5) then begin
		ret=1;
	//End;
End;
//OUTputField1(CALL_55W,"55W");
//OUTputField11(trueCount(H=highest(H,34),5),"短高次數");
