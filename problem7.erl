-module(problem7).
-export([solve/0]).

solve() -> gen_sized([2,3],10001).

gen_sized(List, Size) ->
	case length(List) of
		Size ->
			lists:nth(Size,List);
		_ ->
			gen_sized(gen_next(List),Size)
	end.
gen_next(List) ->
	gen_next(List, lists:max(List) + 1).
gen_next(List, Next) ->
	Q = will_divide(Next, List),
	if
		Q ->
			gen_next(List, Next + 1);
		true ->
			List ++ [Next]
	end.

will_divide(_, []) ->
	false;
will_divide(Num, [H|T]) ->
	if
		Num rem H =:= 0 ->
			true;
		true ->
			will_divide(Num, T)
	end.
