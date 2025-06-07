{@type:filter|@guid:f7a5c9cbe57543ef9cba30d6efbacaa1}
input:period(15,"過去幾期內");
input:low_times(3,"創幾次以上新低");
var:low_record(0);   //創低價
var:low_times_record(0);  //創新低次數
var:i(0);  //迴圈計數變數

settotalBar(period+1);

low_record=low[period];
low_times_record=0; //每根都要歸0
for i=1 to period-1 begin
	if low[period-i]<low_record then begin //創低
		low_times_record+=1;   //創低次數+1
		low_record=low[period-i];  //紀錄創低價
	end;
end;

if low_times_record>=low_times and low<low_record  and average(v,period)>800 then ret=1;

outputField(1,low_times_record,"創低幾次");
outputField(2,low_record,"之前的創低價");


