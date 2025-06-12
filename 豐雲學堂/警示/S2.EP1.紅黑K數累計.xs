{@type:sensor|@guid:478a2f2a97a340e48ec47b8c2bb44f6c}
//僅供範例教學
//投資人可自行調整更改input數值
//input
input: xnets(3,"紅-黑次數");

//不需要intraBarPersist
var: reds(0);
var: blacks(0);
var: xdates(0);

if date <> xdates then begin
	reds = 0;
	blacks = 0;
	xdates = date;
end;
if close >= open then reds += 1;
if close < open then blacks += 1;

if reds-blacks <= -xnets then 
begin
     ret = 1;
	 retmsg="空方力道";
end
else if reds-blacks >= xnets then 
begin
     ret = 1;
	 retmsg="多方力道";
end;