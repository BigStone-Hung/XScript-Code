{@type:indicator|@guid:7c60a9d0910f49b1b9ff53a6cd123cc1}
//書本說威廉有領先訊號  蘭弦用來判多空之用  而蘭弦發現改良之乖離似有更領先之勢
VALUE1=percentr(55)-50;
VALUE2=(bias(21)+bias(34));
VALUE3=(percentr(55)-50)-((bias(21)+bias(34))*2);
CONDITION1=trueAll(VALUE1[1]<0,3) and VALUE1>VALUE1[1] and V>V[1];
CONDITION2=(VALUE2[1]>0 and VALUE2>0) or (VALUE1[1]<0 and VALUE1>0);
Plot1(VALUE1, "威廉55",checkbox:=1);
Plot2(VALUE2, "乖離55",checkbox:=0);
Plot3(VALUE3, "差離55",checkbox:=0);
If CONDITION1 and CONDITION2 and not(CONDITION2[1]) then PLOT6(1,"訊號",checkbox:=1) else PLOT6(0,"訊號",checkbox:=1);


