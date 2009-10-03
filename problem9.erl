-module(problem9).
-export([solve/0]).

solve() ->
	[{A,B,C}|_] = pythag(1000),
	A*B*C.

pythag(N) ->
	D = lists:seq(1,N),
	[{A,B,C} || A <- D, B <- D, C <- D, A+B+C=:=N, A*A+B*B=:=C*C].
