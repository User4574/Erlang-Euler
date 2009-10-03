-module(problem29).
-export([solve/0]).

solve() ->
	length(sets:to_list(sets:from_list(genlist(100)))).

genlist(N) ->
	L = lists:seq(2,N),
	[math:pow(X,Y) || X <- L, Y <- L].
