-module(problem206).
-export([solve/0]).

solve() ->
	work(1).

work(N) ->
	S = N * N,
	test(N,integer_to_list(S)).

test(N, [49,_,50,_,51,_,52,_,53,_,54,_,55,_,56,_,57,_,48]) ->
	N;
test(N, _) ->
	work(N + 1).
