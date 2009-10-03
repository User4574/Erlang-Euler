-module(problem39).
-export([solve/0]).

solve() ->
	N = lists:seq(1,1000),
	L = [{X,length(pythag(X))} || X <- N],
	hd(lists:sort(fun({_,A},{_,B}) -> A > B end, L)).

pythag(N) ->
	D = lists:seq(1,N),
	[{A,B,C} || A <- D,B <- D, C <- D, A+B+C=:=N, A*A+B*B=:=C*C].
