{@type:indicator|@guid:a322691b38ed4f439c27aafff78595b9}
Input: aa(10,"短周期");
Input: bb(20,"中周期");
Input: cc(60,"長周期");
var:H_(9999),L_(0);;
var:count_(0);
input:days_(20,"N天內突破"); //突破N天內關鍵高點


condition1 = ( turnoverRate(aa) cross over turnoverRate(bb) )   and (turnoverRate(bb)>turnoverRate(cc));
value1= barsLast (turnoverRate(bb)>2 
and condition1  
and rsv(270)>75
and average(getField("成交量", "D"),5)>2000);
//Value1數值代表前N跟K棒發生周轉突破訊號，ex:2代表前2根K棒、10代表前10K棒

if value1>=days_ then //若在N天內肥發生突破事件，則value1歸0
begin
	value1=0;
	count_=0;  // 突破次數歸0 *
end;

if value1 > 0 and value1<days_ then 
	begin 
		h_=H[value1]; //關鍵高
		L_=L[value1]; //關鍵低
		plot1(H_,"周轉關鍵高點");
		plot2(L_,"周轉關鍵低點");
		if C cross over H_*1.02  and count_=0 then  //收盤價>關鍵高+2%視為突破訊號，且為第一次突破訊號(count_=0) *
		  begin
		     plot3(C,"突破關鍵價");
             count_=1;  //只記錄第一次發生突破  *
		  end;
	end
else 
if value1=0 then
begin 
		h_=9999;
		L_=1;
        count_=0;

end;

if count_=1 then noplot(1);
