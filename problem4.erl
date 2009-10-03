-module(problem4).
-export([solve/0]).

solve() ->
	lists:max([list_to_integer(X) || X <- palindromes()]).
palindromes() ->
	[X || X <- words(), X =:= lists:reverse(X)].
words() ->
	[integer_to_list(X) || X <- numbers()].
numbers() ->
	Z = lists:seq(100,999),
	[X*Y || X <- Z, Y <- Z].
