{@type:indicator|@guid:f8a5510a1bf340c69c1a14f77db2e6c8}
//XQ:SCO
Array: arrA[12](0);

arrA[1]=S1_SCO_T0S001();
arrA[2]=S1_SCO_T0S002();
arrA[3]=S1_SCO_T0S003();
arrA[4]=S1_SCO_T0S004();
arrA[5]=S1_SCO_T0S005();
arrA[6]=S1_SCO_T0S006();
arrA[7]=S1_SCO_T0S007();
arrA[8]=S1_SCO_T0S008();
arrA[9]=S1_SCO_T0S009();
arrA[10]=S1_SCO_T0S010();
arrA[11]=S1_SCO_T0S011();
arrA[12]=S1_SCO_T0S012();

value95 = NthExtremesArray(arrA,12,1,1,value101,value102);
value96 = NthExtremesArray(arrA,12,2,1,value103,value104);
value97 = NthExtremesArray(arrA,12,3,1,value105,value106);
value98 = NthExtremesArray(arrA,12,4,1,value107,value108);

plot1(value101,"No1");
plot2(value102,"No1陣列數");
plot3(value103,"No2");
plot4(value104,"No2陣列數");
plot5(value105,"No3");
plot6(value106,"No3陣列數");
plot7(value107,"No4");
plot8(value108,"No4陣列數");