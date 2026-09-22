:- hypothetical(true).
:- weak_unification(a3).
:- indexing(false).
%:-module(program,[]).

%:-dynamic([main/0, many_fact/1, fact/2]).

bench :-
  many_fact(200).
  
many_fact(0).
many_fact(N) :-
  N>0,
	fact(1000, _),
  N1 is N-1,
  many_fact(N1).

fact(0, 1).
fact(1, 1).
fact(N, F) :-
  N>1,
  N1 is N-1,
  fact(N1, F1),
  F is F1*N.