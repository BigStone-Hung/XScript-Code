{@type:filter|@guid:fcca949f2e49495c9fe3ecd98f16eb0b}
setbarfreq("AD");
settotalbar(145);
VALUE1=highest(H,144);
VALUE2=VALUE1*0.79;
condition1=VALUE2>VALUE2[1];
condition2=C[13]<VALUE1[21];
IF condition1 then ret=1;