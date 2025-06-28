{@type:sensor|@guid:d3066787907b4d009e9ee0d948568727}
Vars: Str1("");
str1=numtostr(estvolume,0);

if volume[1]>300 then begin//昨量300-1000口間
   if estvolume > volume[1]*3//估量比昨量增2倍以上
      then ret=1;
	  retmsg=str1;
end;