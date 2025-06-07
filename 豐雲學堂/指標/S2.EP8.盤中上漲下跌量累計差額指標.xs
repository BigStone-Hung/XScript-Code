{@type:indicator|@guid:654fe7823705403f8fe72f8af0d488b6}
input:
bos(true,"類別",inputkind:=dict(["大戶",true],["散戶",false]),quickedit:=true),
p(100,"大戶門檻(萬元)");
variable:i(0),tv(0),tp1(0),tp(0);

i=0;
if date<>date[1] then 
    begin
	    value1=0;
		value2=0;
    end;
	
if V>0 then 
    begin
		while GetField("時間","Tick")[i]>=time and GetFieldDate("成交量","Tick")[i]=date
			i+=1;
			
		while i>0 
		    begin
				i-=1;
				tv=GetField("成交量","Tick")[i];
				tp=GetField("收盤價","Tick")[i];
				tp1=GetField("收盤價","Tick")[i+1];
				condition1=0.1*tv*tp>=p;
				
				if tp>tp1 then 
				    begin
						condition2=true;
						condition3=false;
				    end;
					
				if tp<tp1 then 
				    begin
						condition2=false;
						condition3=true;
				    end;
					
				if condition1 then 
					begin
						if condition2 then value1+=tv;
						if condition3 then value1-=tv;
					end
				else
				    begin
					    if condition2 then value2+=tv;
						if condition3 then value2-=tv;
					end;
			end;
    end;


if bos then value3=value1 else value3=value2;


if value3>=0 then plot1(value3,"大戶買賣超");
if value3<0 then plot2(value3,"大戶買賣超");

if not bos
    then begin
	   setplotLabel(1,"散戶買賣超");
	   setplotLabel(2,"散戶買賣超");
	 end;
