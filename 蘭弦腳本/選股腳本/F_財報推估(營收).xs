{@type:filter|@guid:d7e705886dbe4eafba64b22db4c53193}
INPUT:SEL(0);
SETBarFreq("Q","AD");
SETTOtalBar(56);
VALUE1=SUMmation(GetField("月營收", "M"),3)*100;//季營收
VALUE2=ROUND(AVERage(GetField("營業毛利率", "Q"),2),2);//毛利率
VALUE3=highest(GetField("營業費用", "Q"),4);
VALUE4=highest(GetField("所得稅費用", "Q"),4);
VALUE5=(VALUE1*(VALUE2/100)-VALUE3-VALUE4);
//VALUE15=GetField("加權平均股數", "Q")*100;
VALUE15=(GetField("本期稅後淨利", "Q")/GetField("每股稅後淨利(元)", "Q"));
VALUE6=((VALUE1*(VALUE2/100)-VALUE3-VALUE4)/VALUE15);//推估季EPS
VALUE7=((VALUE6-GetField("每股稅後淨利(元)", "Q"))/GetField("每股稅後淨利(元)", "Q"))*100;//新EPS 成長率
VALUE8=IFF(VALUE7+GetField("殖利率", "D")>25,25,VALUE7+GetField("殖利率", "D"));//預期報酬率
VALUE9=VALUE8/GetField("本益比", "D");  //總報酬本益比
OUTputField1(ROUND(VALUE1,0),"季營收");
OUTputField2(VALUE2,"毛利率");
OUTputField3(ROUND(VALUE3,0),"營業費用");
OUTputField4(ROUND(VALUE4,0),"所得稅");
//OUTputField5(ROUND(VALUE5,0),"???");
OUTputField8(ROUND(VALUE15,0),"平均股數");
OUTputField9(GetField("每股稅後淨利(元)", "Q"),"原EPS");
OUTputField10(ROUND(VALUE6,2),"估EPS");
OUTputField11(ROUND(VALUE7,0),"成長%");
OUTputField12(GetField("殖利率", "D"),"殖利率");
OUTputField13(ROUND(VALUE8,0),"總報酬%");
OUTputField14(GetField("本益比", "D"),"本益比");
OUTputField15(ROUND(VALUE9,2),"總報酬/本益");

OUTputField19(CALL_LQ,"蘭質");
CONDITION1=VALUE6>0 and GetField("本益比", "D")<50 and VALUE6>0;
IF CONDITION1 THEN RET=1;

