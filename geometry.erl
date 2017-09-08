-module(geometry).
-export([area/1, tests/0]).

tests() ->
	16 = area({rectangle, 2, 8}),
	4  = area({square, 2}),
	tests_worked.

area({rectangle, Width, Length}) -> Width * Length;
area({square, Side}) -> Side * Side.