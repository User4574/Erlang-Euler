-module(problem31).
-export([solve/0]).

solve() ->
	length(gen_list(200)) + 8.

gen_list(M) ->
	A = lists:seq(0,198),
	B = lists:seq(0,99),
	C = lists:seq(0,39),
	D = lists:seq(0,19),
	E = lists:seq(0,9),
	F = lists:seq(0,3),
	G = lists:seq(0,1),
	[ {S,T,U,V,W,X,Y} ||
		S <- A, T <- B, U <- C, V <- D,
		W <- E, X <- F, Y <- G,
		S + 2*T + 5*U + 10*V + 20*W +
		50*X + 100*Y =:= M ].
