-module(problem48).
-export([solve/0]).

solve() ->
	series(1000).

series(0) ->
	0;
series(N) ->
	pow(N,N) + series(N-1).

pow(_,0) ->
	1;
pow(B,E) ->
	B * pow(B,E-1).
