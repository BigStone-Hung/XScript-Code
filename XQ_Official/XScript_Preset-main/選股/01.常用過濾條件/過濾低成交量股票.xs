{@type:filter}
input:Length(5, "均量天期");
input:VolumeLimit(500, "最小均量");

SetTotalBar(3);

Value1 = Average(volume, Length);
Ret = Value1 > VolumeLimit;

SetOutputName1("成交均量");
OutputField1(Value1);