-module(problem12).
-export([solve/0]).

solve() -> test(1).

test(N) ->
	T = ((N * (N + 1)) div 2),
	D = (2 * length([X || X <- lists:seq(1, erlang:trunc(math:sqrt(T))), (T rem X) =:= 0])),
	if
		D > 500 ->
			T;
		true ->
			test(N+1)
	end.
