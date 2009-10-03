-module(problem2).
-export([solve/0]).

solve() ->
	S = spawn(fun() -> loop([2]) end),
	work(S, 4000000, 1, 2).

work(S, M, X, Y) ->
	Z = X + Y,
	if
		Z > M ->
			S ! {self(), done};
		true ->
			S ! {self(), Z}
	end,
	receive
		continue ->
			work(S, M, Y, Z);
		R ->
			R
	end.

loop(L) ->
	receive
		{From , X} when is_integer(X) ->
			if
				X rem 2 =:= 0 ->
					From ! continue,
					loop(L++[X]);
				true ->
					From ! continue,
					loop(L)
			end;
		{From, done} ->
			From ! lists:sum(L)
	end.
