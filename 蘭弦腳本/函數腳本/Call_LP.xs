{@type:function|@guid:f0157a17c801485c8ad3f135d0f7a39e}
settotalBar(1);
VALUE1=GetField("本期稅後淨利", "Q")/GetField("每股稅後淨利(元)", "Q");
VALUE2=(GetField("營業利益", "Q")-GetField("所得稅費用", "Q"))/VALUE1;
Call_LP=ROUND(IFF(GetField("營業利益", "Q")>0 AND VALUE2>0,GetField("Close")/(VALUE2*4),0),0);


