-module(problem14).
-export([solve/0]).

solve() ->
	rep(1,1000000,1,1).

do(N, C) ->
	if
		N == 1 ->
			C;
		N rem 2 == 0 ->
			do((N div 2), (C + 1));
		N rem 2 > 0 ->
			do(((3 * N) + 1), (C + 1))
	end.

rep(Num, Max, Top, TN) ->
	if
		Num > Max ->
			TN;
		true ->
			L = do(Num, 1),
			if
				L > Top ->
					rep((Num + 1), Max, L, Num);
				true ->
					rep((Num + 1), Max, Top, TN)
			end
	end.
