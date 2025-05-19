{@type:indicator|@guid:da5982a51c0741488d0c4d58280b6e37}
settbmode(1);
if gettotalbar-currentbar=200 then value1=C;
if gettotalbar-currentbar<=200 then plot1(value1,"扣抵白線",checkbox:=0);