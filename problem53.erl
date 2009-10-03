-module(problem53).
-export([solve/0]).

solve() ->
	L = lists:seq(1,100),
	G = [fact(N) div (fact(R) * fact(N-R)) ||
		N <- L, R <- L, R < N],
	H = [X || X <- G, X > 1000000],
	length(H).

fact(1) ->
	1;
fact(N) ->
	N * fact(N-1).
