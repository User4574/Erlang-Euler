-module(problem10).
-export([solve/0]).

solve() -> gen_list([2,3],2000000).

gen_list(List,Max) ->
	O = gen_next(List),
	if
		O > Max ->
			lists:sum(List);
		true ->
			gen_list(List++[O],Max)
	end.

gen_next(List) ->
	gen_next(List, lists:max(List) + 1).
gen_next(List, Next) ->
	Q = will_divide(Next, List),
	if
		Q ->
			gen_next(List, Next + 1);
		true ->
			Next
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
