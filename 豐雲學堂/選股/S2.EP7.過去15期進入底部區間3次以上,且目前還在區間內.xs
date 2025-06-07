{@type:filter|@guid:1de721474f2e444baac40bed3f3163b6}
input:times_thred(3,"進入底部區間的次數"); 
input:range_ratio(2,"底部區間寬度(%)");
input:period(15,"計算期數");
var:lower_bound(0); //區間股價下界
var:upper_bound(0); //區間股價上界;
var:times_record(0); //紀錄進入底部區間的次數
var:i(0);  //迴圈計數變數

settotalBar(period+1);

lower_bound=lowest(low[1],period);
upper_bound=lower_bound*(1+range_ratio/100);
times_record=0;//紀錄進入底部區間的次數，每根都要歸0

for i= period downto 1 begin
	if c[i]>=lower_bound and c[i]<=upper_bound then begin 
		times_record+=1;   //進入區間次數+1
	end;
end;

if times_record>=times_thred and c>=lower_bound and c<=upper_bound and average(v,period)>800 then ret=1;


outputField(1,times_record,"入底部區間幾次");
outputField(2,lower_bound,"區間股價下界");

