{@type:sensor|@guid:c4864ed6cd3340e49eaf7f3e69b797b4}
value1=highest(high,60);//60日高點
value2=lowest(low,60);//60日低點

value3=value1-value2;//60日高-60日低
value4=value2+(value3*0.382);//60日低+(高低差*0.382);
value5=value2+(value3*0.5);//60日低+(高低差*0.5);
value6=value2+(value3*0.618);//60日低+(高低差*0.618);

if close cross above value6 then ret=1;