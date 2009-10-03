-module(problem56).
-export([solve/0]).

solve() ->
	lists:max(gen_sums(99)).

gen_sums(M) ->
	[digital_sum(X) || X <- gen_list(M)].

gen_list(M) ->
	L = lists:seq(1,M),
	[pow(A,B) || A <- L, B <- L].

digital_sum(Number) when is_integer(Number) ->
	digital_sum(integer_to_list(Number));
digital_sum([]) ->
	0;
digital_sum([H|T]) ->
	(H-48) + digital_sum(T).

pow(_,0) ->
	1;
pow(B,1) ->
	B;
pow(B,E) ->
	B * pow(B,E-1).
