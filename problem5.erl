-module(problem5).
-export([solve/0,test/2]).

solve() -> test(1,20).

test(Num,Max) ->
	T = wont_divide(Num,lists:seq(1,Max)),
	if
		T ->
			test(Num+1,Max);
		true ->
			Num
	end.

wont_divide(_, []) ->
	false;
wont_divide(Num, [H|T]) ->
	if
		Num rem H =/= 0 ->
			true;
		true ->
			wont_divide(Num, T)
	end.
