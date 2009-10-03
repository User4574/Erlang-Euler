-module(problem15).
-export([solve/0]).

solve() ->
	N = 40,
	K = 20,
	fact(N) div (fact(K) * fact(N-K)).

fact(0) ->
	1;
fact(N) ->
	N * fact(N-1).
