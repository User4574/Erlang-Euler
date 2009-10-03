-module(problem99).
-export([pow/2,solve/0]).
-import(problem99a,[getpairs/0]).

solve() ->
	work(getpairs(),[]).

work([],L) ->
	maxn(L);
work([{A,B}|T],L) ->
	work(T,[round(pow(A,B))|L]).

maxn(L) ->
	mwork(1,lists:reverse(L),1,0).

mwork(_,[],M,_) ->
	M;
mwork(N,[H|T],M,O) ->
	if
		H > O ->
			mwork(N+1,T,N,H);
		true ->
			mwork(N+1,T,M,O)
	end.

pow(X, N) when is_integer(N), N >= 0 -> pow(X, N, 1).

pow(_, 0, P) -> P;
pow(X, N, A) -> pow(X, N-1, A*X).
