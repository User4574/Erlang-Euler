-module(p45c).
-export([solve/1]).

triangles(F,M) -> F ! {1, [ (N * (N + 1)) div 2 || N <- lists:seq(1,M) ]}. 
pentagons(F,M) -> F ! {2, [ (N * ((3 * N) - 1)) div 2 || N <- lists:seq(1,M) ]}. 
hexagons(F,M) -> F ! {3, [ N * ((2 * N) + 1) || N <- lists:seq(1,M) ]}.

max(M) -> M * ((2 * M) + 1).

nums(M) ->
	spawn(fun() -> triangles(self(),M) end),
	spawn(fun() -> pentagons(self(),M) end),
	spawn(fun() -> hexagons(self(),M) end),
	{T, P, H} = receive
		{1, X} ->
			receive
				{2, Y} ->
					receive
						{3, Z} -> {X, Y, Z}
					end;
				{3, Y} ->
					receive
						{2, Z} -> {X, Z, Y}
					end
			end;
		{2, X} ->
			receive
				{1, Y} ->
					receive
						{3, Z} -> {Y, X, Z}
					end;
				{3, Y} ->
					receive
						{1, Z} -> {Z, X, Y}
					end
			end;
		{3, X} ->
			receive
				{1, Y} ->
					receive
						{2, Z} -> {Y, Z, X}
					end;
				{2, Y} ->
					receive
						{1, Z} -> {Z, Y, X}
					end
			end
	end,
	[ E || E <- lists:seq(1,max(M)), lists:member(E,T), lists:member(E, P), lists:member(E,H) ].

getnext([_]) -> "Keep trying.";
getnext([40755,X|_]) -> X;
getnext([_|T]) -> getnext(T).

solve(M) -> getnext(nums(M)).
