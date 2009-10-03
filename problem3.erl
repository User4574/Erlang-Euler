-module(problem3).
-export([solve/0]).

solve() -> whittle(600851475143,[2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97],1).

whittle(Num,List,Max) ->
	Q = will_divide(Num, List),
	if
		Num =:= 1 ->
			Max;
		Q ->
			H = which_divides(Num,List),
			if
				H > Max ->
					whittle(Num div H, List, H);
				true ->
					whittle(Num div H, List, Max)
			end;
		true ->
			whittle(Num, gen_next(List), Max)
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
which_divides(Num, [H|T]) ->
	if
		Num rem H =:= 0 ->
			H;
		true ->
			which_divides(Num, T)
	end.
