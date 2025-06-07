{@type:indicator|@guid:daa76668b5c74340ac08000c886256e9}
//============================'
//更新日期:20241111
//Ver.1 : 10類股
//Ver.2 : 21類股
// 
//===========================
//===========================
settotalBar(3600);
//_________A 宣告區_________

Array: arrA[25](0);
Array: LayGoo[25]("");
Array: LayGoo_ID[25,10]("");
if array_GetMaxIndex(LayGoo)<>array_GetMaxIndex(arrA) then raiseruntimeerror("陣列數字錯誤");
if isFirstCall("Date") then value999=0;
 
 //_________B 類股漲跌區_________
//01.營建商
Value1=((GetSymbolField("2501.tw","收盤價","D")+0.0001) - GetSymbolField("2501.tw","參考價","D"))/GetSymbolField("2501.tw","參考價","D")*100;
Value2=((GetSymbolField("2527.tw","收盤價","D")+0.0001) - GetSymbolField("2527.tw","參考價","D"))/GetSymbolField("2527.tw","參考價","D")*100;
Value3=((GetSymbolField("6177.tw","收盤價","D")+0.0001) - GetSymbolField("6177.tw","參考價","D"))/GetSymbolField("6177.tw","參考價","D")*100;
Value4=((GetSymbolField("9946.tw","收盤價","D")+0.0001) - GetSymbolField("9946.tw","參考價","D"))/GetSymbolField("9946.tw","參考價","D")*100;
Value5=((GetSymbolField("1316.tw","收盤價","D")+0.0001) - GetSymbolField("1316.tw","參考價","D"))/GetSymbolField("1316.tw","參考價","D")*100;
Value6=((GetSymbolField("2520.tw","收盤價","D")+0.0001) - GetSymbolField("2520.tw","參考價","D"))/GetSymbolField("2520.tw","參考價","D")*100;
Value7=((GetSymbolField("1532.tw","收盤價","D")+0.0001) - GetSymbolField("1532.tw","參考價","D"))/GetSymbolField("1532.tw","參考價","D")*100;
Value8=((GetSymbolField("2506.tw","收盤價","D")+0.0001) - GetSymbolField("2506.tw","參考價","D"))/GetSymbolField("2506.tw","參考價","D")*100;
value9=((GetSymbolField("2540.tw","收盤價","D")+0.0001) - GetSymbolField("2540.tw","參考價","D"))/GetSymbolField("2540.tw","參考價","D")*100;
arrA[1]=(value1+value2+value3+value4+value5+value6+value7+value8+value9)/9;


//02.重電
Value11=((GetSymbolField("1519.tw","收盤價","D")+0.0001) - GetSymbolField("1519.tw","參考價","D"))/GetSymbolField("1519.tw","參考價","D")*100;
Value12=((GetSymbolField("1514.tw","收盤價","D")+0.0001) - GetSymbolField("1514.tw","參考價","D"))/GetSymbolField("1514.tw","參考價","D")*100;
Value13=((GetSymbolField("1513.tw","收盤價","D")+0.0001) - GetSymbolField("1513.tw","參考價","D"))/GetSymbolField("1513.tw","參考價","D")*100;
Value14=((GetSymbolField("1503.tw","收盤價","D")+0.0001) - GetSymbolField("1503.tw","參考價","D"))/GetSymbolField("1503.tw","參考價","D")*100;
arrA[2]=(value11+value12+value13+value14)/4;


//03.電網
Value15=((GetSymbolField("4588.tw","收盤價","D")+0.0001) - GetSymbolField("4588.tw","參考價","D"))/GetSymbolField("4588.tw","參考價","D")*100;
Value16=((GetSymbolField("1609.tw","收盤價","D")+0.0001) - GetSymbolField("1609.tw","參考價","D"))/GetSymbolField("1609.tw","參考價","D")*100;
Value17=((GetSymbolField("1608.tw","收盤價","D")+0.0001) - GetSymbolField("1608.tw","參考價","D"))/GetSymbolField("1608.tw","參考價","D")*100;
Value18=((GetSymbolField("1618.tw","收盤價","D")+0.0001) - GetSymbolField("1618.tw","參考價","D"))/GetSymbolField("1618.tw","參考價","D")*100;
value19=((GetSymbolField("1603.tw","收盤價","D")+0.0001) - GetSymbolField("1603.tw","參考價","D"))/GetSymbolField("1603.tw","參考價","D")*100;
arrA[3]=(value15+value16+value17+value18+value19)/5;

//04.觀光
Value20=((GetSymbolField("2731.tw","收盤價","D")+0.0001) - GetSymbolField("2731.tw","參考價","D"))/GetSymbolField("2731.tw","參考價","D")*100;
Value21=((GetSymbolField("5706.tw","收盤價","D")+0.0001) - GetSymbolField("5706.tw","參考價","D"))/GetSymbolField("5706.tw","參考價","D")*100;
Value22=((GetSymbolField("2722.tw","收盤價","D")+0.0001) - GetSymbolField("2722.tw","參考價","D"))/GetSymbolField("2722.tw","參考價","D")*100;
Value23=((GetSymbolField("2736.tw","收盤價","D")+0.0001) - GetSymbolField("2736.tw","參考價","D"))/GetSymbolField("2736.tw","參考價","D")*100;
Value24=((GetSymbolField("2743.tw","收盤價","D")+0.0001) - GetSymbolField("2743.tw","參考價","D"))/GetSymbolField("2743.tw","參考價","D")*100;
arrA[4]=(value20+value21+value22+value23+value24)/5;

//05.飛機
Value25=((GetSymbolField("2618.tw","收盤價","D")+0.0001) - GetSymbolField("2618.tw","參考價","D"))/GetSymbolField("2618.tw","參考價","D")*100;
Value26=((GetSymbolField("2610.tw","收盤價","D")+0.0001) - GetSymbolField("2610.tw","參考價","D"))/GetSymbolField("2610.tw","參考價","D")*100;
arrA[5]=(value25+value26)/2;

//06.飯店
Value27=((GetSymbolField("2748.tw","收盤價","D")+0.0001) - GetSymbolField("2748.tw","參考價","D"))/GetSymbolField("2748.tw","參考價","D")*100;
Value28=((GetSymbolField("5704.tw","收盤價","D")+0.0001) - GetSymbolField("5704.tw","參考價","D"))/GetSymbolField("5704.tw","參考價","D")*100;
Value29=((GetSymbolField("2736.tw","收盤價","D")+0.0001) - GetSymbolField("2736.tw","參考價","D"))/GetSymbolField("2736.tw","參考價","D")*100;
Value30=((GetSymbolField("2705.tw","收盤價","D")+0.0001) - GetSymbolField("2705.tw","參考價","D"))/GetSymbolField("2705.tw","參考價","D")*100;
arrA[6]=(value27+value28+Value29+Value30)/4;

//07.機殼
Value31=((GetSymbolField("6117.tw","收盤價","D")+0.0001) - GetSymbolField("6117.tw","參考價","D"))/GetSymbolField("6117.tw","參考價","D")*100;
Value32=((GetSymbolField("3013.tw","收盤價","D")+0.0001) - GetSymbolField("3013.tw","參考價","D"))/GetSymbolField("3013.tw","參考價","D")*100;
Value33=((GetSymbolField("8210.tw","收盤價","D")+0.0001) - GetSymbolField("8210.tw","參考價","D"))/GetSymbolField("8210.tw","參考價","D")*100;
Value34=((GetSymbolField("3693.tw","收盤價","D")+0.0001) - GetSymbolField("3693.tw","參考價","D"))/GetSymbolField("3693.tw","參考價","D")*100;
arrA[7]=(value31+value32+value33+value34)/4;


//08.大散熱(模組)
Value35=((GetSymbolField("2421.tw","收盤價","D")+0.0001) - GetSymbolField("2421.tw","參考價","D"))/GetSymbolField("2421.tw","參考價","D")*100;
Value36=((GetSymbolField("3017.tw","收盤價","D")+0.0001) - GetSymbolField("3017.tw","參考價","D"))/GetSymbolField("3017.tw","參考價","D")*100;
Value37=((GetSymbolField("6230.tw","收盤價","D")+0.0001) - GetSymbolField("6230.tw","參考價","D"))/GetSymbolField("6230.tw","參考價","D")*100;
Value38=((GetSymbolField("3324.tw","收盤價","D")+0.0001) - GetSymbolField("3324.tw","參考價","D"))/GetSymbolField("3324.tw","參考價","D")*100;
arrA[8]=(value35+value36+value37+value38)/4;

//09.小散熱(水冷)
Value39=((GetSymbolField("6125.tw","收盤價","D")+0.0001) - GetSymbolField("6125.tw","參考價","D"))/GetSymbolField("6125.tw","參考價","D")*100;
Value40=((GetSymbolField("1587.tw","收盤價","D")+0.0001) - GetSymbolField("1587.tw","參考價","D"))/GetSymbolField("1587.tw","參考價","D")*100;
Value41=((GetSymbolField("3338.tw","收盤價","D")+0.0001) - GetSymbolField("3338.tw","參考價","D"))/GetSymbolField("3338.tw","參考價","D")*100;
Value42=((GetSymbolField("2241.tw","收盤價","D")+0.0001) - GetSymbolField("2241.tw","參考價","D"))/GetSymbolField("2241.tw","參考價","D")*100;
arrA[9]=(value39+value40+value41+value42)/4;;

//10.矽光
Value43=((GetSymbolField("4908.tw","收盤價","D")+0.0001) - GetSymbolField("4908.tw","參考價","D"))/GetSymbolField("4908.tw","參考價","D")*100;
Value44=((GetSymbolField("3234.tw","收盤價","D")+0.0001) - GetSymbolField("3234.tw","參考價","D"))/GetSymbolField("3234.tw","參考價","D")*100;
Value45=((GetSymbolField("3363.tw","收盤價","D")+0.0001) - GetSymbolField("3363.tw","參考價","D"))/GetSymbolField("3363.tw","參考價","D")*100;
Value46=((GetSymbolField("4979.tw","收盤價","D")+0.0001) - GetSymbolField("4979.tw","參考價","D"))/GetSymbolField("4979.tw","參考價","D")*100;
Value47=((GetSymbolField("6530.tw","收盤價","D")+0.0001) - GetSymbolField("6530.tw","參考價","D"))/GetSymbolField("6530.tw","參考價","D")*100;
Value48=((GetSymbolField("6442.tw","收盤價","D")+0.0001) - GetSymbolField("6442.tw","參考價","D"))/GetSymbolField("6442.tw","參考價","D")*100;
arrA[10]=(value43+value44+value46+value47+value45+value48)/6;

//11.自駕車
Value49=((GetSymbolField("1533.tw","收盤價","D")+0.0001) - GetSymbolField("1533.tw","參考價","D"))/GetSymbolField("1533.tw","參考價","D")*100;
Value50=((GetSymbolField("2401.tw","收盤價","D")+0.0001) - GetSymbolField("2401.tw","參考價","D"))/GetSymbolField("2401.tw","參考價","D")*100;
Value51=((GetSymbolField("2497.tw","收盤價","D")+0.0001) - GetSymbolField("2497.tw","參考價","D"))/GetSymbolField("2497.tw","參考價","D")*100;
arrA[11]=(Value49+Value50+Value51)/3;

//12.HBM通路
Value52=((GetSymbolField("8096.tw","收盤價","D")+0.0001) - GetSymbolField("8096.tw","參考價","D"))/GetSymbolField("8096.tw","參考價","D")*100;
Value53=((GetSymbolField("8112.tw","收盤價","D")+0.0001) - GetSymbolField("8112.tw","參考價","D"))/GetSymbolField("8112.tw","參考價","D")*100;
Value54=((GetSymbolField("6189.tw","收盤價","D")+0.0001) - GetSymbolField("6189.tw","參考價","D"))/GetSymbolField("6189.tw","參考價","D")*100;
arrA[12]=(Value52+Value53+Value54)/3;

//13.被動元件
Value55=((GetSymbolField("2327.tw","收盤價","D")+0.0001) - GetSymbolField("2327.tw","參考價","D"))/GetSymbolField("2327.tw","參考價","D")*100;
Value56=((GetSymbolField("2375.tw","收盤價","D")+0.0001) - GetSymbolField("2375.tw","參考價","D"))/GetSymbolField("2375.tw","參考價","D")*100;
Value57=((GetSymbolField("3236.tw","收盤價","D")+0.0001) - GetSymbolField("3236.tw","參考價","D"))/GetSymbolField("3236.tw","參考價","D")*100;
Value58=((GetSymbolField("6173.tw","收盤價","D")+0.0001) - GetSymbolField("6173.tw","參考價","D"))/GetSymbolField("6173.tw","參考價","D")*100;
Value59=((GetSymbolField("6449.tw","收盤價","D")+0.0001) - GetSymbolField("6449.tw","參考價","D"))/GetSymbolField("6449.tw","參考價","D")*100;
Value60=((GetSymbolField("8121.tw","收盤價","D")+0.0001) - GetSymbolField("8121.tw","參考價","D"))/GetSymbolField("8121.tw","參考價","D")*100;
arrA[13]=(Value55+Value56+Value57+value58+value59+value60)/6;


//14.機器人
Value61=((GetSymbolField("2374.tw","收盤價","D")+0.0001) - GetSymbolField("2374.tw","參考價","D"))/GetSymbolField("2374.tw","參考價","D")*100;
Value62=((GetSymbolField("2359.tw","收盤價","D")+0.0001) - GetSymbolField("2359.tw","參考價","D"))/GetSymbolField("2359.tw","參考價","D")*100;
Value63=((GetSymbolField("6215.tw","收盤價","D")+0.0001) - GetSymbolField("6215.tw","參考價","D"))/GetSymbolField("6215.tw","參考價","D")*100;
Value64=((GetSymbolField("2049.tw","收盤價","D")+0.0001) - GetSymbolField("2049.tw","參考價","D"))/GetSymbolField("2049.tw","參考價","D")*100;
Value65=((GetSymbolField("2464.tw","收盤價","D")+0.0001) - GetSymbolField("2464.tw","參考價","D"))/GetSymbolField("2464.tw","參考價","D")*100;
arrA[14]=(Value61+Value62+Value63+Value64+Value65)/5;

//15.海運
Value66=((GetSymbolField("2603.tw","收盤價","D")+0.0001) - GetSymbolField("2603.tw","參考價","D"))/GetSymbolField("2603.tw","參考價","D")*100;
Value67=((GetSymbolField("2615.tw","收盤價","D")+0.0001) - GetSymbolField("2615.tw","參考價","D"))/GetSymbolField("2615.tw","參考價","D")*100;
Value68=((GetSymbolField("2609.tw","收盤價","D")+0.0001) - GetSymbolField("2609.tw","參考價","D"))/GetSymbolField("2609.tw","參考價","D")*100;

arrA[15]=(Value66+Value67+Value68)/3;

//16軍工
Value69=((GetSymbolField("1342.tw","收盤價","D")+0.0001) - GetSymbolField("1342.tw","參考價","D"))/GetSymbolField("1342.tw","參考價","D")*100;
Value70=((GetSymbolField("2634.tw","收盤價","D")+0.0001) - GetSymbolField("2634.tw","參考價","D"))/GetSymbolField("2634.tw","參考價","D")*100;
Value71=((GetSymbolField("8033.tw","收盤價","D")+0.0001) - GetSymbolField("8033.tw","參考價","D"))/GetSymbolField("8033.tw","參考價","D")*100;
Value72=((GetSymbolField("6139.tw","收盤價","D")+0.0001) - GetSymbolField("6139.tw","參考價","D"))/GetSymbolField("6139.tw","參考價","D")*100;
arrA[16]=(Value69+Value70+Value71+value72)/4;


//17太陽能
Value73=((GetSymbolField("6244.tw","收盤價","D")+0.0001) - GetSymbolField("6244.tw","參考價","D"))/GetSymbolField("6244.tw","參考價","D")*100;
Value74=((GetSymbolField("6477.tw","收盤價","D")+0.0001) - GetSymbolField("6477.tw","參考價","D"))/GetSymbolField("6477.tw","參考價","D")*100;
Value75=((GetSymbolField("6443.tw","收盤價","D")+0.0001) - GetSymbolField("6443.tw","參考價","D"))/GetSymbolField("6443.tw","參考價","D")*100;
Value76=((GetSymbolField("2406.tw","收盤價","D")+0.0001) - GetSymbolField("2406.tw","參考價","D"))/GetSymbolField("2406.tw","參考價","D")*100;
arrA[17]=(Value73+Value74+Value75+value76)/4;

//18生技
Value77=((GetSymbolField("6446.tw","收盤價","D")+0.0001) - GetSymbolField("6446.tw","參考價","D"))/GetSymbolField("6446.tw","參考價","D")*100;
Value78=((GetSymbolField("1795.tw","收盤價","D")+0.0001) - GetSymbolField("1795.tw","參考價","D"))/GetSymbolField("1795.tw","參考價","D")*100;
Value79=((GetSymbolField("4743.tw","收盤價","D")+0.0001) - GetSymbolField("4743.tw","參考價","D"))/GetSymbolField("4743.tw","參考價","D")*100;
Value80=((GetSymbolField("6472.tw","收盤價","D")+0.0001) - GetSymbolField("6472.tw","參考價","D"))/GetSymbolField("6472.tw","參考價","D")*100;
arrA[18]=(Value77+Value78+Value79+value80)/4;

//19再生新法
Value81=((GetSymbolField("3224.tw","收盤價","D")+0.0001) - GetSymbolField("3224.tw","參考價","D"))/GetSymbolField("3224.tw","參考價","D")*100;
Value82=((GetSymbolField("1784.tw","收盤價","D")+0.0001) - GetSymbolField("1784.tw","參考價","D"))/GetSymbolField("1784.tw","參考價","D")*100;
Value83=((GetSymbolField("4160.tw","收盤價","D")+0.0001) - GetSymbolField("4160.tw","參考價","D"))/GetSymbolField("4160.tw","參考價","D")*100;
Value84=((GetSymbolField("6615.tw","收盤價","D")+0.0001) - GetSymbolField("6615.tw","參考價","D"))/GetSymbolField("6615.tw","參考價","D")*100;
arrA[19]=(Value81+Value82+Value83+value84)/4;

//20.Cowos設備

Value85=((GetSymbolField("6187.tw","收盤價","D")+0.0001) - GetSymbolField("6187.tw","參考價","D"))/GetSymbolField("6187.tw","參考價","D")*100;
Value86=((GetSymbolField("5443.tw","收盤價","D")+0.0001) - GetSymbolField("5443.tw","參考價","D"))/GetSymbolField("5443.tw","參考價","D")*100;
Value87=((GetSymbolField("6640.tw","收盤價","D")+0.0001) - GetSymbolField("6640.tw","參考價","D"))/GetSymbolField("6640.tw","參考價","D")*100;
Value88=((GetSymbolField("3583.tw","收盤價","D")+0.0001) - GetSymbolField("3583.tw","參考價","D"))/GetSymbolField("3583.tw","參考價","D")*100;
Value89=((GetSymbolField("6640.tw","收盤價","D")+0.0001) - GetSymbolField("6640.tw","參考價","D"))/GetSymbolField("6640.tw","參考價","D")*100;
Value90=((GetSymbolField("3131.tw","收盤價","D")+0.0001) - GetSymbolField("3131.tw","參考價","D"))/GetSymbolField("3131.tw","參考價","D")*100;
Value91=((GetSymbolField("8028.tw","收盤價","D")+0.0001) - GetSymbolField("8028.tw","參考價","D"))/GetSymbolField("8028.tw","參考價","D")*100;
Value92=((GetSymbolField("2467.tw","收盤價","D")+0.0001) - GetSymbolField("2467.tw","參考價","D"))/GetSymbolField("2467.tw","參考價","D")*100;
arrA[20]=(Value85+Value86+Value87+value88+Value89+Value90+Value91+Value92)/8;

//21.FOPLP

Value93=((GetSymbolField("3580.tw","收盤價","D")+0.0001) - GetSymbolField("3580.tw","參考價","D"))/GetSymbolField("3580.tw","參考價","D")*100;
Value94=((GetSymbolField("8064.tw","收盤價","D")+0.0001) - GetSymbolField("8064.tw","參考價","D"))/GetSymbolField("8064.tw","參考價","D")*100;
Value95=((GetSymbolField("6664.tw","收盤價","D")+0.0001) - GetSymbolField("6664.tw","參考價","D"))/GetSymbolField("6664.tw","參考價","D")*100;
Value96=((GetSymbolField("3535.tw","收盤價","D")+0.0001) - GetSymbolField("3535.tw","參考價","D"))/GetSymbolField("3535.tw","參考價","D")*100;
arrA[21]=(Value93+Value94+Value95+Value96)/4;

//22.先進封裝
Value97=((GetSymbolField("3374.tw","收盤價","D")+0.0001) - GetSymbolField("3374.tw","參考價","D"))/GetSymbolField("3374.tw","參考價","D")*100;
Value98=((GetSymbolField("2449.tw","收盤價","D")+0.0001) - GetSymbolField("2449.tw","參考價","D"))/GetSymbolField("2449.tw","參考價","D")*100;
arrA[22]=(Value97+Value98)/2;

//23.PCB設備廠
Value99=((GetSymbolField("8027.tw","收盤價","D")+0.0001) - GetSymbolField("8027.tw","參考價","D"))/GetSymbolField("8027.tw","參考價","D")*100;
Value100=((GetSymbolField("3581.tw","收盤價","D")+0.0001) - GetSymbolField("3581.tw","參考價","D"))/GetSymbolField("3581.tw","參考價","D")*100;
Value101=((GetSymbolField("6664.tw","收盤價","D")+0.0001) - GetSymbolField("6664.tw","參考價","D"))/GetSymbolField("6664.tw","參考價","D")*100;
arrA[23]=(Value99+Value100+Value101)/3;


//24.玻璃基板
Value102=((GetSymbolField("6405.tw","收盤價","D")+0.0001) - GetSymbolField("6405.tw","參考價","D"))/GetSymbolField("6405.tw","參考價","D")*100;
Value103=((GetSymbolField("3149.tw","收盤價","D")+0.0001) - GetSymbolField("3149.tw","參考價","D"))/GetSymbolField("3149.tw","參考價","D")*100;
Value104=((GetSymbolField("3615.tw","收盤價","D")+0.0001) - GetSymbolField("3615.tw","參考價","D"))/GetSymbolField("3615.tw","參考價","D")*100;
arrA[24]=(Value102+Value103+Value104)/3;


//25.BBU電池
Value105=((GetSymbolField("3323.tw","收盤價","D")+0.0001) - GetSymbolField("3323.tw","參考價","D"))/GetSymbolField("3323.tw","參考價","D")*100;
Value106=((GetSymbolField("6558.tw","收盤價","D")+0.0001) - GetSymbolField("6558.tw","參考價","D"))/GetSymbolField("6558.tw","參考價","D")*100;
Value107=((GetSymbolField("6121.tw","收盤價","D")+0.0001) - GetSymbolField("6121.tw","參考價","D"))/GetSymbolField("6121.tw","參考價","D")*100;
Value108=((GetSymbolField("3625.tw","收盤價","D")+0.0001) - GetSymbolField("3625.tw","參考價","D"))/GetSymbolField("3625.tw","參考價","D")*100;
Value109=((GetSymbolField("3211.tw","收盤價","D")+0.0001) - GetSymbolField("3211.tw","參考價","D"))/GetSymbolField("3211.tw","參考價","D")*100;
Value110=((GetSymbolField("4931.tw","收盤價","D")+0.0001) - GetSymbolField("4931.tw","參考價","D"))/GetSymbolField("4931.tw","參考價","D")*100;
Value111=((GetSymbolField("6781.tw","收盤價","D")+0.0001) - GetSymbolField("6781.tw","參考價","D"))/GetSymbolField("6781.tw","參考價","D")*100;
arrA[25]=(Value105+Value106+Value107+Value108+Value109+Value110+Value111)/7;




 //_________C 類股名稱區_________

LayGoo[1]="1營建";
LayGoo[2]="2重電";
LayGoo[3]="3電網";
LayGoo[4]="4觀光";
LayGoo[5]="5飛機";
LayGoo[6]="6飯店";
LayGoo[7]="7機殼";
LayGoo[8]="8大散熱";
LayGoo[9]="9小散熱";
LayGoo[10]="10矽光子";
LayGoo[11]="11自駕車";
LayGoo[12]="12HBM通路";
LayGoo[13]="13被動元件";
LayGoo[14]="14機器人";
LayGoo[15]="15海運";
LayGoo[16]="16軍工";
LayGoo[17]="17太陽能";
LayGoo[18]="18生技";
LayGoo[19]="19再生新法";
LayGoo[20]="20CoWoS設備";
LayGoo[21]="21FOPLP";
LayGoo[22]="22先進封裝";
LayGoo[23]="23PCB設備";
LayGoo[24]="24玻璃基板";
LayGoo[25]="25BBU電池";

//===============繪圖區==============================
VAR:pa_1(0),loc_1(0);
VAR:pa_2(0),loc_2(0);
VAR:pa_3(0),loc_3(0);
VAR:pa_4(0),loc_4(0);
//最強
PLOT1(0,"===前3強族群====");
nTHExtremesArray(arrA,Array_GetMaxIndex(arrA),1,1,pa_1,loc_1);
plot2(pa_1);
setplotLabel(2,LayGoo[loc_1]);
//次強
nTHExtremesArray(arrA,Array_GetMaxIndex(arrA),2,1,pa_2,loc_2);
plot4(pa_2);
setplotLabel(4,LayGoo[loc_2]);
//3強
nTHExtremesArray(arrA,Array_GetMaxIndex(arrA),3,1,pa_3,loc_3);
plot5(pa_3);
setplotLabel(5,LayGoo[loc_3]);


PLOT6(0,"____________________");

PLOT21(0,"===前3弱族群====");

//最強
nTHExtremesArray(arrA,Array_GetMaxIndex(arrA),3,-1,pa_1,loc_1);
plot22(pa_1);
setplotLabel(22,LayGoo[loc_1]);
//次強
nTHExtremesArray(arrA,Array_GetMaxIndex(arrA),2,-1,pa_2,loc_2);
plot24(pa_2);
setplotLabel(24,LayGoo[loc_2]);
//3強
nTHExtremesArray(arrA,Array_GetMaxIndex(arrA),1,-1,pa_3,loc_3);
plot25(pa_3);
setplotLabel(25,LayGoo[loc_3]);

//if loc_1<>loc_1[1] or loc_2<> loc_2[1] or  loc_3<> loc_3[1]  then plot87(pa_1);



