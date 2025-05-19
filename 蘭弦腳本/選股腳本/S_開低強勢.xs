{@type:filter|@guid:be4bb762254d48dd8f9f6004dc65065c}
setbarfreq("AD");
settotalbar(3);
Condition1=V>V[1] and L[1]<L[2] and O<C[1]*0.99 and C>C[1]*1.007 and C>maxlist(O[1],C[1]);
If GetField("成交金額(元)", "D")>3000000 and Condition1 then RET=1;
OUTputField1(GetField("成交金額(元)", "D"),"成交金額(元)");