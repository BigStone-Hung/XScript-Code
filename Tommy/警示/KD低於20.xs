{@type:sensor|@guid:cb3030fa7eca4979b8ec1651ff05e1be}
// XQ: KD指標
//
input: Length(9), RSVt(3), Kt(3);
variable: rsv(0), k(0), _d(0);

SetInputName(1, "天數");
SetInputName(2, "RSVt權數");
SetInputName(3, "Kt權數");

Stochastic(Length, RSVt, Kt, rsv, k, _d);

if k>80 and _d>80 then ret=1;