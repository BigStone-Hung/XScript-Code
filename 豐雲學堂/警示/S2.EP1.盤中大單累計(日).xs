{@type:sensor|@guid:3ed7068b54544a489febd441eb1e9c27}
input: xticks(3,"大單門檻");
input: xcounts(6,"累積次數");

var: intraBarPersist xtimes(0);
var: intraBarPersist xdates(0);

if date <> xdates then 
 begin
  xtimes=0;
  xdates=date;
 end;

//getField("Volume")
   
if q_tickVolume>= xticks then xtimes+=1;

if xtimes >= xcounts then 
  begin
   xtimes=0;
   ret=1;
  end;