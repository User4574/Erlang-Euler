-module(problem8).
-export([solve/0]).
-import(problem8a,[getnum/0]).

solve() ->
	work(getnum(),0).


work([_,_,_,_],Acc) ->
	Acc;
work([A,B,C,D,E|T],Acc) ->
	F = A*B*C*D*E,
	if
		F > Acc ->
			work([B,C,D,E|T],F);
		true ->
			work([B,C,D,E|T],Acc)
	end.
