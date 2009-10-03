-module(problem97).
-export([solve/0]).

solve() -> (28433 * pow(7830457))+1.

pow(E) -> pow2(2,E).
pow2(B,1) -> B;
pow2(B,E) -> pow2(2*B, E-1).
