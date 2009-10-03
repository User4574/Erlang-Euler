-module(problem6).
-export([solve/0]).

solve() -> diff(lists:seq(1,100)).

diff(List) ->
	M = sum_of_squares(List),
	N = square_of_sum(List),
	if
		M < N ->
			N - M;
		M > N ->
			M - N;
		true ->
			0
	end.

sum_of_squares(List) ->
	lists:sum(lists:map(fun(X) -> X*X end, List)).
square_of_sum(List) ->
	O = lists:sum(List),
	O*O.
