{@type:filter|@guid:74e07172323e454c9e759669e614b67b}

input : day(2,"K線", inputkind:=dict(["多方略強",2],["多方續強",3],["多方強勢",5]));

input : day1(2,"法人買",inputkind:=dict(["小買",2],["續買",4]));

input : myprice(h," 計算基準" , inputkind:=symbolprice());


value1 = getField("法人買賣超張數", "D");

condition1 = trueAll(c > o ,day) ;

//連續紅K次數

condition2 = trueAll(myprice > myprice[1],day) ;

//連續過高次數

condition3 = trueAll(value1 > 0 ,day1) ;

//法人連續買超

if condition1 and condition2 and condition3 then ret = 1 ;



