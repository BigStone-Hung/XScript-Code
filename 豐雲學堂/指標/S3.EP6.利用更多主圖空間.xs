{@type:indicator|@guid:c616cca70154471e9e115d1af55a279e}
Input:half(false,"減高度",inputkind:=dict(["正常",false],["一半",true]),quickedit:=true);

if C>C[1] then plot2(V,"成交量")
else if C<C[1] then plot3(V,"成交量")
else if C=C[1] then plot4(V,"成交量");

if half then plot1(V*2);
