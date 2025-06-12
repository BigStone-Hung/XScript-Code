{@type:sensor|@guid:948e7e61bc44403bb064b3d92717e9f4}
//選股腳本+警示

IF openD(0) > closeD(1) THEN 
ret=1;
retMsg=("昨日OSC向上穿越0且今日開高");


