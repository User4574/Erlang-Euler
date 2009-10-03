-module(problem73).
-export([solve/0]).

solve() ->
	length([ X || X <- genlist(), X > 1/3, X < 1/2]).

genlist() ->
	O = lists:seq(1,10000),
	[ N / D || N <- O, D <- O, N < D, gcd(N,D) =:= 1 ].

gcd(A, 0) -> A;
gcd(A, B) -> gcd(B, A rem B).
