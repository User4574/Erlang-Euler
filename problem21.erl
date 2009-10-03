-module(problem21).
-export([solve/0]).

solve() ->
	L = test(1, []),
	pairs(L, 0).

test(10000, L) ->
	L;
test(A,L) ->
	D = [X || X <- lists:seq(1, erlang:trunc(math:sqrt(A))), (A rem X) =:= 0],
	E = [A div Y || Y <- D],
	F = sets:to_list(sets:from_list((D ++ E) -- [A])),
	G = lists:sum(F),
	test(A+1, [{A,G}|L]).

pairs([_], S) ->
	S;
pairs([{A,B}|T], S) ->
	M = lists:member({B, A}, T),
	if
		M ->
			pairs(T, S+A+B);
		true ->
			pairs(T, S)
	end.
