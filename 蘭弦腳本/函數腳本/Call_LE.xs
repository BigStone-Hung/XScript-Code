{@type:function|@guid:df90445b36a2419e89a9e3e050489a7f}
SETFirstBarDate(20230101);
VALUE111=SUMmation(GetField("月營收", "M"),3)*100;//季營收

IF GetField("營業毛利率", "Q")>GetField("營業毛利率", "Q")[1] and SUMmation(GetField("月營收", "M"),3)>SUMmation(GetField("月營收", "M")[3],3) then 
	VALUE112=ROUND(AVERage(GetField("營業毛利率", "Q"),2),2)
Else
	VALUE112=MINList(GetField("營業毛利率", "Q"),GetField("營業毛利率", "Q")[1]);
	
VALUE113=highest(GetField("營業費用", "Q"),4);
VALUE114=highest(GetField("所得稅費用", "Q"),4);
VALUE115=(VALUE111*(VALUE112/100)-VALUE113-VALUE114)*1000000;
VALUE116=GetField("發行張數(張)", "D")*1000;//VALUE116=(GetField("本期稅後淨利", "Q")/GetField("每股稅後淨利(元)", "Q"));
VALUE117=(VALUE115/VALUE116);//推估季EPS
Call_LE=VALUE117;


