{@type:sensor|@guid:905fce1917ad4af2b7d6d70da97dbedf}
input: xticks(3,"大單門檻");
input: xcounts(6,"累積次數");

var:  xtimes(0);
var:  xdates(0);

if date <> xdates then 
 begin
  xtimes=0;
  xdates=date;

 end;
  
 if getField("Volume")>= xticks then xtimes+=1;
 print("無intrabar","date",date,"time",time,"日期變數",xdates,"累積次數",xtimes,"單量",q_tickVolume);
 if xtimes >= xcounts then 
  begin
   xtimes=0;
   ret=1;
   end;