-module(problem42).
-export([solve/0]).
-import(problem42a,[getwords/0]).

solve() ->
	V = [value(X) || X <- getwords()],
	T = numbers(lists:max(V), 1, [1]),
	length([Y || Y <- V, lists:member(Y,T)]).

numbers(M,N,L) ->
	O = lists:max(L),
	if
		O >= M ->
			L;
		true ->
			numbers(M,N+1,[((N*(N+1)) div 2) | L])
	end.

value([H|T]) ->
	if
		(H > 64) and (H < 91) ->
			(H - 64) + value(T);
		(H > 96) and (H < 123) ->
			(H - 96) + value(T);
		true ->
			value(T)
	end;
value([]) ->
	0.
