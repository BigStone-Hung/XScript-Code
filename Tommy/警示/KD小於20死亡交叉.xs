{@type:sensor|@guid:de3e695bae9c47e8bbca8057e9efc6c7}
input: Length(9), RSVt(3), Kt(3);

SetTotalBar(maxlist(Length,6) * 3 + 8);

SetInputName(1, "計算期數");
SetInputName(2, "RSVt權數");
SetInputName(3, "Kt權數");

variable: rsv(0), k(0), _d(0);

Stochastic(Length, RSVt, Kt, rsv, k, _d);

if k<20 and _d<20 and k crosses below _d then ret=1;