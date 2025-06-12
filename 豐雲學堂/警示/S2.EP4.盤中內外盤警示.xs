{@type:sensor|@guid:0f5ca35512d94feba577a4448a2990a8}
var: intraBarPersist timex(0) , intraBarPersist sum(0);

settotalBar(3000);

value1 = GetField("內盤量");//

value2 = GetField("外盤量");//

value3 = value2 - value1 ;

timex = timex[1] + value3 ;

if date <> date[1] and time = 090000 then begin
    timex = value3 ;
    sum = 0 ;
end ;




if time >= 090000 and time <= 100000 then begin
    if value3 > 0 and value3 > value3[1] then begin
	    sum = sum + 1 ;
end ;
end ;

if sum >= 3 then ret = 1 ;
