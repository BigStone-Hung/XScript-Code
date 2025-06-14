{@type:indicator|@guid:720e44f5ac964cb982144baafa02528d}

value1=GetField("累計委買")-GetField("累計委賣");

if time=045500 then value2=value1;

if time>084000 and time<135000 then plot1(value1-value2) else plot1(value1);
