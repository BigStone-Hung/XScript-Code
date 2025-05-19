{@type:filter|@guid:0afa1c5a966f4eb5a927642e1f7a0221}
SETBarFreq("AW");
var: HO(0), HH(0), HL(0), HC(0);
if currentbar = 1 then
  HO = (open + close) / 2
else
  HO = (HO[1] + HC[1]) / 2;
HC = (open + high + low + close) / 4;
HH = maxlist(high, HO, HC);
HL = minlist(low, HO, HC);
CONDITION1=HC>HO and TRueAll(HC[1]<HO[1],4);
IF CONDITION1 THEN RET=1;