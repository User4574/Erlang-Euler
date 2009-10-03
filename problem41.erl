-module(problem41).
-export([solve/0]).

solve() ->
	Pan = gen_perms(),
	Pri = gen_primes([2,3]),
	lists:max([X || X <- Pan, lists:member(X, Pri)]).

gen_perms() -> [list_to_integer(X) || X <- perms("123456789")].

perms([]) -> [[]];
perms(L) -> [[H|T] || H <- L, T <- perms(L--[H])].

gen_primes(L) ->
	if
		hd(L) > 987654321 ->
			tl(L);
		true ->
			gen_primes(gen_next(L))
	end.
gen_next(List) ->
	gen_next(List, lists:max(List) + 1).
gen_next(List, Next) ->
	Q = will_divide(Next, List),
	if
		Q ->
			gen_next(List, Next + 1);
		true ->
			[Next|List]
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
