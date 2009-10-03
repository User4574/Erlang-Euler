-module(problem22).
-export([solve/0]).

solve() ->
	word_values(read_words("names.txt"), 1, 0).

word_values([], _, V) ->
	V;
word_values([H|T], N, V) ->
	word_values(T, N + 1, V + (N * value(H))).

read_words(Filename) ->
	{ok, File} = file:read_file(Filename),
	L = binary_to_list(File),
	N = string:tokens(L, ","),
	lists:sort(fun(A,B) -> A < B end, N).

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
