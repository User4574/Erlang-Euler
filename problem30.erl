-module(problem30).
-export([solve/0]).

solve() ->
	Seq = lists:seq(2, 9999999),
%				Yeah, that's an arbitrary upper limit =P
	lists:sum(
		lists:filter(
			fun(X) -> num(X) end,
			Seq
		)
	).

num(Int) ->
	Int =:= lists:sum(
		lists:map(
			fun(X) -> pow(X, 5) end,
			itol(Int)
		)
	).

itol(Int) ->
	Str = integer_to_list(Int),
	lists:map(
		fun(X) -> (X - 48) end,
		Str
	).

pow(B, 1) ->
	B;
pow(B, E) ->
	B * pow(B, E-1).
