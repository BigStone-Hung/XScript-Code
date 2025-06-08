{@type:filter|@guid:35f6639de00f4bf1a810f51e57bc3e46}
input:Length(5,"下跌K棒數"), DownPer(20,"下跌百分比");

value1=(close[length-1]-close)*100/close[length-1];
condition1=value1>DownPer;

if condition1 then ret=1;