:- hypothetical(true).
:- weak_unification(a3).
:- indexing(false).
%:-module(program,[]).

%:-dynamic([main/0, derive/1, derive/5, d/3]).

bench :-
  derive(5000).

derive(N) :-
  (expr1((x + 1) * ((^(x, 2) + 2) * (^(x, 3) + 3))) => 
   expr2(((((((((x / x) / x) / x) / x) / x) / x) / x) / x) / x) => 
   expr3(log(log(log(log(log(log(log(log(log(log(x))))))))))) => 
   expr4(((((((((x * x) * x) * x) * x) * x) * x) * x) * x) * x) => 
   (expr1(E1), expr2(E2), expr3(E3), expr4(E4)),
   derive(N, E1, E2, E3, E4)).
  
derive(0, _E1, _E2, _E3, _E4).
derive(N, E1, E2, E3, E4) :-
  N>0,
  N1 is N-1,
  d(E1,x,_),
  d(E2,x,_),
  d(E3,x,_),
  d(E4,x,_),
  derive(N1, E1, E2, E3, E4).

d(U + V, X, DU + DV) :-
	d(U, X, DU),
	d(V, X, DV).
d(U - V, X, DU - DV) :-
	d(U, X, DU),
	d(V, X, DV).
d(U * V, X, DU * V + U * DV) :-
	d(U, X, DU),
	d(V, X, DV).
d(U / V, X, (DU * V - U * DV) / ^(V, 2)) :-
	d(U, X, DU),
	d(V, X, DV).
d(^(U, N), X, DU * N * ^(U, N1)) :-
	N1 is N - 1,
	d(U, X, DU).
d(-U, X, -DU) :-
	d(U, X, DU).
d(exp(U), X, exp(U) * DU) :-
	d(U, X, DU).
d(log(U), X, DU / U) :-
	d(U, X, DU).
d(x, x, 1).
d(N, _, 0) :-
  number(N).
