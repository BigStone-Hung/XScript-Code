{@type:filter|@guid:19c51bfe37484f8383ca8ed2bcb6ca6b}
// 月月配選股法
SETBackBar(100);
value1=GetFieldDate("月營收","M"); //202304
value2=datevalue(date,"M");  //5
value3=datevalue(value1,"M");  //4
value4=getField("每股稅後淨利(元)", "Q");  
value5=getField("每股稅後淨利(元)", "Q")[0]+getField("每股稅後淨利(元)", "Q")[1]+getField("每股稅後淨利(元)", "Q")[2];
value6=GetField("累計營收年增率","M"); //4
value7=GetField("殖利率", "D");
value8=GetField("除權息日期");
value9=PercentB(Close,20,2,2);
value10=getField("股利合計", "Y");
value11=GetField("成交量", "W");
value12=getField("現金派息比率", "Y"); 
value13=datevalue(GetFieldDate("每股稅後淨利(元)", "Y"),"Y");  //2022
value14=datevalue(date,"Y");  //2023
value15=datevalue(GetFieldDate("除權息日期", "Y"),"Y");  //2022
value16=GetField("月營收年增率", "M"); //4
value17=GetFieldDate("每股稅後淨利(元)", "Q"); 
value18=datevalue(value17,"M");  //3
if {value2-value3=1 and value2-value18=2
   and} getField("每股稅後淨利(元)", "Y")>getField("每股稅後淨利(元)", "Y")[1] and value7>3 and value6>0 and value16>0
   and value15>=2022 then ret=1;

outputField1(getField("每股稅後淨利(元)", "Y"),"2022_EPS");	
outputField2(value4,"2023Q1_Eps");
outputField3(value12,"2022_派息率");
outputField4(getField("股利合計", "Y")[1],"2021股利");
outputField5(getField("股利合計", "Y"),"2022股利");
outputField6(value8,"除權息日期",order:=1);
outputfield7(value7,"殖利率");
outputField8(value16,"月營收年增率");
outputField9(value6,"累計營收年增率");
outputField10(value11,"周vol");
outputField11(value9,"%b");
outputField12(value13,"EPS年");
outputField12(value3,"營收月");
outputField13(value15,"除息年");
outputField14(getField("融券最後回補日"),"融券最後回補日");
outputField15(value18,"eps月");
