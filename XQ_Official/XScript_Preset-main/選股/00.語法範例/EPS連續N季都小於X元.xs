{@type:filter}
input:N(4, "期別");
input:X(0, "元"); 

SetTotalBar(3); 

if TrueAll(GetField("EPS", "Q") < X,N) then ret=1; 

SetOutputName1("EPS(元)(季)"); 
OutputField1(GetField("EPS", "Q")); 
