{@type:function|@guid:b4e04474516d45988a28726e7fece651}
value803=0;
IF GetField("營業收入淨額","Q")[3]>GetField("營業收入淨額","Q")[4] then begin
	value803=value803+1;
End;
IF GetField("營業收入淨額","Q")[2]>GetField("營業收入淨額","Q")[3] then begin
	value803=value803+1;
End;
IF GetField("營業收入淨額","Q")[1]>GetField("營業收入淨額","Q")[2] then begin
	value803=value803+1;
End;
IF GetField("營業收入淨額","Q")[0]<GetField("營業收入淨額","Q")[4] then begin
	value803=value803-1;
End;
Call_SE=VALUE803;