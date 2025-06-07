{@type:indicator|@guid:35b4dceb99ae424db4f050934aa95d15}


var: timex(0);

settotalBar(3000);

value1 = GetField("內盤量");//

value2 = GetField("外盤量");//

value3 = value2 - value1 ;

timex = timex[1] + value3 ;

if date <> date[1] and time = 090000 then timex = value3 ;


plot1(timex , "買賣力道") ;

plot2(value3, "及時差") ;
