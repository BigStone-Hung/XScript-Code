{@type:indicator}
//教授的實戰法則
input: Ma1(5, "均線1"), Ma2(10, "均線2"), Ma3(15, "均線3"),
       Ma4(20, "均線4"), Ma5(25, "均線5"), Ma6(30, "均線6"),
       Ma7(35, "均線7"), Ma8(40, "均線8"), Ma9(45, "均線9"), Ma10(50, "均線10");

var: Count(0);

if close > average(close, Ma1) then Count += 1;
if close > average(close, Ma2) then Count += 1;
if close > average(close, Ma3) then Count += 1;
if close > average(close, Ma4) then Count += 1;
if close > average(close, Ma5) then Count += 1;
if close > average(close, Ma6) then Count += 1;
if close > average(close, Ma7) then Count += 1;
if close > average(close, Ma8) then Count += 1;
if close > average(close, Ma9) then Count += 1;
if close > average(close, Ma10) then Count += 1;

if close < average(close, Ma1) then Count -= 1;
if close < average(close, Ma2) then Count -= 1;
if close < average(close, Ma3) then Count -= 1;
if close < average(close, Ma4) then Count -= 1;
if close < average(close, Ma5) then Count -= 1;
if close < average(close, Ma6) then Count -= 1;
if close < average(close, Ma7) then Count -= 1;
if close < average(close, Ma8) then Count -= 1;
if close < average(close, Ma9) then Count -= 1;
if close < average(close, Ma10) then Count -= 1;

plot1(Count, "趨勢分數表");