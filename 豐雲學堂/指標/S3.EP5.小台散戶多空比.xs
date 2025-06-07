{@type:indicator|@guid:48f3898b896a4895952eac754b419ff0}
input:Aver_FIMTX_EUOI(20,"小台散戶多空比均值周期");
var:FIMTX_EUOI(0),StandU_FIMTX_EUOI(0),StandD_FIMTX_EUOI(0);


if getsymbolField("FIMTX*1.TF", "未平倉", "D")<>0 then
value1=(getsymbolField("FIMTX*1.TF", "三大法人賣方未平倉", "D")-
			getsymbolField("FIMTX*1.TF", "三大法人買方未平倉", "D"))*100/
				getsymbolField("FIMTX*1.TF", "未平倉", "D");

plot1(value1,"小台散戶多空比"); 

value2=average(value1,20)+1*standardDev(value1,20,1);
value3=average(value1,20)-1*standardDev(value1,20,1);
plot2(value2,"多方線");
plot3(value3,"空方線");