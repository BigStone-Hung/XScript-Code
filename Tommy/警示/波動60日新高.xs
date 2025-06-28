{@type:sensor|@guid:007bbbc9bc1b4ff29e28f0dfe2092630}
value1=high-low;

if value1>highest(value1[1],60) then ret=1;