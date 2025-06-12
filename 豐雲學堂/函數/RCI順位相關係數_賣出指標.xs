{@type:function|@guid:1aba3350c0be46608bf3875bb834170f}
{RCI為飆股的長相書中作者提及的賣出指標,原理是以近N天股價變化與時間順序來排定趨勢的強弱,適用於股價多空不明時
計算的公式為:RCI=[1-(6D/天數*(天數的平方-1))*100]
其中D的計算方式如下:
1.最近的日期為1,往前推移排至N名
2.將股價由大到小排序,遇到相同股價時可順位或給予各一半的排名(兩者無太大差異)
3.把日期排序減去股價排序並將每一個結果都平方,最後加總,即得到D
當RCI<-70%時則可視為賣出訊號
}

//===============================================================
{將第一個陣列(D_rank[i])寫入指定期數的日期序列,第一個陣列的位置就是1}
var:D(0),dd(0),i(0),j(0),k(0),count(1),jj(0),RCI(0);
array:D_rank[](0),C_rank[](0),CC_rank[](0),DD_rank[](0); //根據使用者定義的天期決定要放多少
input:perd(numericSimple,"計算幾天RCI");
for i = 1 to perd
begin
array_SetMaxIndex(D_rank,perd); //決定好陣列長度->放日期排序
D_rank[i]=i;
end;
//===============================================================
{將第二個陣列(C_rank[j])寫入指定期數的收盤價,第一個陣列的位置就是當期收盤價(1-1=0)}
for j=1 to perd
begin
array_SetMaxIndex(C_rank,perd); //決定好陣列長度->放股價排序
C_rank[j]=c[j-1];
end;
//===============================================================
{由於股價的序列不能更動,所以不能使用array_sort進行排序,因此將陣列1的股價依據進行比較,且以陣列1股價<後續股價為count加總條件
,說明當此股價小於其他股價的總數越多時則排名越後面,起始的count為1
舉例來說,當C_rank[1]為80時,其後續股價為:90、40、30、100、20,此時的count為1+2,因此C_rank[1]的排序為3,並將此數值紀錄於CC_rank[j]中,這樣就可以依照本書的方式進行排序}
for j=1 to perd
begin
 for jj=1 to perd
 begin
 if  C_rank[j]< C_rank[jj] then
 count+=1;
 array_SetMaxIndex(CC_rank,perd); //決定好陣列長度->放股價排序
 end;
 CC_rank[j]=count;
 count=1;
end;
//===============================================================
{將日期排序減去股價排序並且將結果平方後加總即為d值
得到d值之後就可以算rci}
for k=1 to perd
begin
 array_SetMaxIndex(DD_rank,perd);
 DD_rank[k]=D_rank[k]-CC_rank[k];
 DD_rank[k]=square(DD_rank[k]);
 D=array_Sum(DD_rank,1,perd);
end;
RCI=(1-(6*D)/(perd*(square(perd)-1)))*100;
ret=RCI;

