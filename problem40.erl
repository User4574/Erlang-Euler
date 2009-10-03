-module(problem40).
-export([solve/0]).
-import(lists,[nth/2,flatten/1,map/2,seq/2]).

solve() ->
	N = onenum(),
	t(1,N)*t(10,N)*t(100,N)*t(1000,N)*t(10000,N)*t(100000,N)*t(1000000,N).
	
onenum() -> flatten(map(fun(X) -> integer_to_list(X) end, seq(1,400000))).

t(N,L) -> nth(N,L) - 48.
