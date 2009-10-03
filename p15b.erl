-module(problem15).
-export([solve/0]).

solve() ->
	length(perms("DDDDDDDDDDDDDDDDDDDDRRRRRRRRRRRRRRRRRRRR")).

% Tack, Joe.
perms([]) ->
	[[]];
perms(L) ->
	[[H|T] || H <- L, T <- perms(L--[H])].
