{@type:sensor|@guid:3860766d59a343e9920f50af7c398377}
if c>highest(getField("最高價", "D")[1],3) then begin
  ret=1;
end;
