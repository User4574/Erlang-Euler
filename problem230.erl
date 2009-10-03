-module (problem230).
-export ([f/1]).

f(1)->[16#41];
f(2)->[16#42];
f(N)->f(N-2)++f(N-1).
