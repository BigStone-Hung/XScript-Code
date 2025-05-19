{@type:indicator|@guid:6d008bd5932e443fbbfb495a85e2f66a}
VARS:i(0),NMR(0),LMR(0),QRR(0);
IF month(getfield("Date", "M")[1]) <> month(getfield("Date", "M")) then //前一日就會是上個月的最後一天
	begin		
		LMR=NMR;
		NMR=C[1];
		PLOT1(0,"白色零軸");
		VALUE1=IFF(LMR>0,(NMR-LMR)/LMR,0);
		PLOT2(VALUE1,"月百分比");
	End;
IF BARFreq="M" then begin	
	IF month(getfield("Date", "M"))=4 or month(getfield("Date", "M"))=7 or month(getfield("Date", "M"))=10 or month(getfield("Date", "M"))=12 then begin
		QRR=VALUE1+VALUE1[1]+VALUE1[2];
		PLOT3(QRR,"季百分比");
	End;
End;






