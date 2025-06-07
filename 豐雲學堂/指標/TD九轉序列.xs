{@type:indicator|@guid:d0e2e0cd0018407796ab18f5395552be}
input: day1(4,"九轉天數");

variable: A1(0),A2(0),T1(0),T2(0),T3(0),T4(0),T5(0),T6(0),T7(0),T8(0),T9(0),T10(0),T11(0),T12(0),T13(0);
variable: B1(0),B2(0),D1(0),D2(0),D3(0),D4(0),D5(0),D6(0),D7(0),D8(0),D9(0),D10(0),D11(0),D12(0),D13(0);


condition1=C>C[day1];
condition2=C<C[day1];
condition3=condition2 AND condition1[1];
condition4=condition2 AND condition3[1];
condition5=condition2 AND condition4[1];
condition6=condition2 AND condition5[1];
condition7=condition2 AND condition6[1];
condition8=condition2 AND condition7[1];
condition9=condition2 AND condition8[1];
condition10=condition2 AND condition9[1];
condition11=condition2 AND condition10[1];



if condition8 then plot1(L*0.98,"低6"); // 0.98平移作圖位置
if condition9 then plot2(L*0.98,"低7"); // 0.98平移作圖位置
if condition10 then plot3(L*0.98,"低8"); // 0.98平移作圖位置
if condition11 then plot4(L*0.98,"低9"); // 0.98平移作圖位置



condition21=C<C[day1];
condition22=C>C[day1];
condition23=condition22 AND condition21[1];
condition24=condition22 AND condition23[1];
condition25=condition22 AND condition24[1];
condition26=condition22 AND condition25[1];
condition27=condition22 AND condition26[1];
condition28=condition22 AND condition27[1];
condition29=condition22 AND condition28[1];
condition30=condition22 AND condition29[1];
condition31=condition22 AND condition30[1];


if condition28 then plot5(H*1.010,"高6"); // 1.01平移作圖位置
if condition29 then plot6(H*1.010,"高7");
if condition30 then plot7(H*1.010,"高8");
if condition31 then plot8(H*1.010,"高9");
