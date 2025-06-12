{@type:sensor|@guid:4353fe6f5c6e445f93a4ec95b8c4faf6}
//配合多因子選股
//主頻率是60分K，建議用還原60分K
var: flag(0);  // 空手=0、多單在手=1

value1 = xfMin_RSI("AD",GetField("Close","AD"),14);     
value2 = RSI(c,14);  //主頻率可直接下RSI函數即可

//條件1：日RSI大於50
condition1 = value1>50;
//條件2 ：小時RSI大於60
condition2 = value2>60;

//如果空手的時候條件1與條件2同時成立，順便記錄一下部位變成已有多單
if flag=0 and condition1 and condition2 then begin
  ret=1;
  flag=1;
end;

//條件3：小時RSI小於40
condition3 = value2<40;

//如果已有多單的時候條件3成立，順便記錄一下部位變成空手
if flag=1 and condition3 then flag=0;


