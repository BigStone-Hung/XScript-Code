{@type:filter|@guid:78160a03b9554bcd971457201b81342d}
SETBARFreq("Q");
SETTOTALBar(56);
VALUE1=GetField("股東權益報酬率", "Q")/GetField("股價淨值比", "D");

CONDITION9=V<Call_BV and Call_BV<Call_BV[1] and H>H[1] and V<V[1] and Call_W55>0;
value802=0;
value803=0;
	IF GetField("營業收入淨額","Q")[1]>GetField("營業收入淨額","Q")[2] then begin
		value803=value803+1;
		IF GetField("營業收入淨額","Q")[2]>GetField("營業收入淨額","Q")[3] then begin
			value803=value803+1;
			IF GetField("營業收入淨額","Q")[3]>GetField("營業收入淨額","Q")[4] then begin
				value803=value803+1;
			End;
		End;
	End;

If value803>0 and CONDITION9 
	and GetField("股東權益報酬率", "Q")>5 and GetField("股價淨值比", "D")<5 then begin
		RET=1;
End;
OUTputField(2,value803,"淡旺");
OUTputField(3,VALUE1,"權益價值");

