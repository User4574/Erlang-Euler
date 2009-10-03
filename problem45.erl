-module(problem45).
-export([solve/1]).

triangles(M) -> [ (N * (N + 1)) div 2 || N <- lists:seq(1,M) ]. 
pentagons(M) -> [ (N * ((3 * N) - 1)) div 2 || N <- lists:seq(1,M) ]. 
hexagons(M) -> [ N * ((2 * N) + 1) || N <- lists:seq(1,M) ]. 

max(M) -> M * ((2 * M) + 1).

nums(M) ->
	T = triangles(M),
	P = pentagons(M),
	H = hexagons(M),
	[ X || X <- lists:seq(1,max(M)), lists:member(X,T), lists:member(X, P), lists:member(X,H) ].

getnext([_]) -> "Keep trying.";
getnext([40755,X|_]) -> X;
getnext([_|T]) -> getnext(T).

solve(M) -> getnext(nums(M)).
