{@type:filter}
var: myNum(5); //數值變數的宣告
var: myStr(""); //字串變數的宣告
var: myBoolean(true); //布林值變數的宣告
var: myTime(090000); //時間變數的宣告
var: myDate(20220211); //日期變數的宣告

var: myNum_1(0), myNum_2(5), myNum_3(10); //可以在一行程式碼裡宣告多個變數

//數值可以重新指定，也可以進行運算
myNum = 10;
myNum_1 = myNum_2 + myNum_3;
print("myNum", myNum);
print("myNum_1", myNum_1);

//字串可以重新指定
myStr = "給定的字串";
print("myStr", myStr);

//布林值可以重新指定
if myBoolean = true then
myBoolean = false;
print("myBoolean", myBoolean);

//日期與時間可以重新指定
myDate = Date;
print("myDate", myDate, "today", Date);

