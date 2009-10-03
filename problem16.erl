-module(problem16).
-export([solve/0]).

solve() ->
	lists:sum(getlist()).

getlist() ->
	[X-48 || X <- integer_to_list(getnum())].
getnum() ->
	pow2(1000).

pow2(0) ->
	1;
pow2(X) ->
	2 * pow2(X-1).
