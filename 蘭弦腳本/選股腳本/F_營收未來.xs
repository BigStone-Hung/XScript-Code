{@type:filter|@guid:e7823aae5af74e3ea8435e3d70971c96}
//RET=1;
OUTputField11(GetField("預收款項", "Q")[4],"BQ4");
OUTputField12(GetField("預收款項", "Q")[3],"BQ3");
OUTputField13(GetField("預收款項", "Q")[2],"BQ2");
OUTputField14(GetField("預收款項", "Q")[1],"BQ1");
OUTputField15(GetField("預收款項", "Q"),"NOW");
//=================================================================================================================================
OUTputField2(ROUND((GetField("預收款項", "Q")-((GetField("預收款項", "Q")[1]+GetField("預收款項", "Q")[4])/2))/((GetField("預收款項", "Q")[1]+GetField("預收款項", "Q")[4])/2)*100,0),"成長比");
OUTputField3(ROUND(GetField("預收款項", "Q")/average(GetField("營業收入淨額", "Q"),4)*100,0),"占營收%");
OUTputField4(ROUND(GetField("累計營收年增率", "M"),0),"累增%");
OUTputField5(ROUND(GetField("平均售貨天數", "Q")[1],0),"天數");
//=========================================================================================================================================
condition1=highest(GetField("預收款項", "Q"),3)=highest(GetField("預收款項", "Q"),8) and GetField("預收款項", "Q")>GetField("預收款項", "Q")[1];
condition2=ROUND((GetField("預收款項", "Q")-((GetField("預收款項", "Q")[1]+GetField("預收款項", "Q")[4])/2))/((GetField("預收款項", "Q")[1]+GetField("預收款項", "Q")[4])/2)*100,0)>0;
condition3=ROUND(GetField("預收款項", "Q")/average(GetField("營業收入淨額", "Q"),4)*100,0)>3;
condition4=ROUND(GetField("累計營收年增率", "M"),0)>0;
If condition1 and condition2 and condition3 and condition4 then begin
	Ret=1;
End;

