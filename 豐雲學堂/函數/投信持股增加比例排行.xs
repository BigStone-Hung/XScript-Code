{@type:function|@guid:54be8411448842749df7fde0e106f9f2}
value1 = getField("投信持股比例","D");
value2 = value1 - value1[5]; //5天增加比例
retVal = value2;

//利用retval將要排名的key值回傳