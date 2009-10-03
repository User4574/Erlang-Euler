-module(problem35).
-export([solve/0]).

solve() ->
	Primes = gen_list([3,2],1000000),
	length(lists:map(fun(X) -> allin(rot(X, []), Primes) end, Primes)).

gen_list(List,Max) ->
	O = gen_next(List),
	if
		O > Max ->
			List;
		true ->
			gen_list([O|List],Max)
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

rot(Num, [Num|T]) ->
	[Num|T];
rot(Num, []) ->
	[A|B] = integer_to_list(Num),
	rot(Num, [list_to_integer(B++[A])]);
rot(Num, [H|T]) ->
	[A|B] = integer_to_list(H),
	rot(Num, [list_to_integer(B++[A]),H|T]).

allin(L1, L2) ->
	L3 = lists:map(fun(X) -> lists:member(X, L2) end, L1),
	lists:foldl(fun(X, ASF) -> X and ASF end, true, L3).
