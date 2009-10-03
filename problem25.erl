-module(problem25).
-export([solve/0]).

solve() ->
	fibdigits(1000, 2, 1, 1).

fibdigits(N, M, A, B) ->
	L = length(integer_to_list(A)),
	if
		L =:= N ->
			M;
		true ->
			fibdigits(N, M+1, A+B, A)
	end.
