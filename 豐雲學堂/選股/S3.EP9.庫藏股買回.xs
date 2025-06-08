{@type:filter}
settotalBar(6);
condition1 = datediff(Date, getField("庫藏股開始日期")) < 5 and datediff(Date, getField("庫藏股開始日期")) >= 0;
condition2 = getfield("庫藏股預計買回張數") >= 5000;
condition3 = getField("庫藏股預計買回張數") / getField("發行張數(張)", "D") > 0.01;

if condition1 and condition2 and condition3  and date = currentDate then ret = 1;
outputField1(getField("庫藏股開始日期"), 0, "庫藏股開始日期");
outputField2(getfield("庫藏股預計買回張數"), 0, "庫藏股預計買回張數");
