-module(problem36).
-export([solve/0]).

lists() -> [ integer_to_list(X) || X <- lists:seq(1,1000000) ].

palindromes() -> [ list_to_integer(X) || X <- lists(), X =:= lists:reverse(X) ].

binaries() -> [ hd(io_lib:format("~.2B", [X])) || X <- palindromes() ].

bin_pal() -> [ X || X <- binaries(), X =:= lists:reverse(X) ].

make_3ples() -> [ io_lib:fread("~2u", X) || X <- bin_pal() ].

make_decs() -> [ Val || {ok, [Val], _} <- make_3ples() ].

solve() -> lists:sum(make_decs()).
