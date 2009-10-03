-module(problem71).
-export([solve/0]).

solve() ->
	find(genlist()).

find([{A,_},{3,7}|_]) -> A;
find(L) -> find(tl(L)).

genlist() ->
	O = lists:seq(1,1000000),
	[ {N, D} || N <- O, D <- O, N < D, gcd(N,D) =:= 1 ].

gcd(A, 0) -> A;
gcd(A, B) -> gcd(B, A rem B).
