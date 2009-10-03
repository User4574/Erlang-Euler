-module(problem20).
-export([solve/0]).

solve() -> lists:sum([X-48 || X <- integer_to_list(fact(100))]).
fact(1) -> 1; fact(X) -> X * fact(X-1).
