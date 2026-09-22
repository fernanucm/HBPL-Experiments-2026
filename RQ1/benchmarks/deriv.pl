:- hypothetical(true).
:- weak_unification(a3).
:- indexing(false).
%:-module(program,[]).

% :-dynamic([main/0, derive/1, derive/5, ops8/1, divide10/1, log10/1, times10/1, d/3]).

bench :-
  derive(1500).
  
% derive(0).
% derive(N) :-
%   N>0,
% 	ops8(_E1), divide10(_E2), log10(_E3), times10(_E4),
%   N1 is N-1,
%   derive(N1).
derive(N) :-
  E1 = (x + 1) * ((^(x, 2) + 2) * (^(x, 3) + 3)), 
  E2 = ((((((((x / x) / x) / x) / x) / x) / x) / x) / x) / x, 
  E3 = log(log(log(log(log(log(log(log(log(log(x)))))))))), 
  E4 = ((((((((x * x) * x) * x) * x) * x) * x) * x) * x) * x, 
  derive(N, E1, E2, E3, E4).
  
derive(0, _E1, _E2, _E3, _E4).
derive(N, E1, E2, E3, E4) :-
  N>0,
  N1 is N-1,
  d(E1,x,_),
  d(E2,x,_),
  d(E3,x,_),
  d(E4,x,_),
  derive(N1, E1, E2, E3, E4).


ops8(E) :-
	d((x + 1) * ((^(x, 2) + 2) * (^(x, 3) + 3)), x, E).

divide10(E) :-
	d(((((((((x / x) / x) / x) / x) / x) / x) / x) / x) / x, x, E).

log10(E) :-
	d(log(log(log(log(log(log(log(log(log(log(x)))))))))), x, E).

times10(E) :-
	d(((((((((x * x) * x) * x) * x) * x) * x) * x) * x) * x, x, E).

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
