-module(problem24).
-export([solve/0]).

solve() ->
	L = lists:seq(0,9),
	lists:nth(1000000,
		[{A,B,C,D,E,F,G,H,I,J} ||
			A <- L,
			B <- L,
			C <- L,
			D <- L,
			E <- L,
			F <- L,
			G <- L,
			H <- L,
			I <- L,
			J <- L,
			B=/=A,
			C=/=A, C=/=B,
			D=/=A, D=/=B, D=/=C,
			E=/=A, E=/=B, E=/=C, E=/=D,
			F=/=A, F=/=B, F=/=C, F=/=D, F=/=E,
			G=/=A, G=/=B, G=/=C, G=/=D, G=/=E, G=/=F,
			H=/=A, H=/=B, H=/=C, H=/=D, H=/=E, H=/=F, H=/=G,
			I=/=A, I=/=B, I=/=C, I=/=D, I=/=E, I=/=F, I=/=G, I=/=H,
			J=/=A, J=/=B, J=/=C, J=/=D, J=/=E, J=/=F, J=/=G, J=/=H, J=/=I
		]
	).
