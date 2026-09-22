:- hypothetical(true).
:- weak_unification(a3).
:- indexing(false).
%:-module(program,[]).

%:-dynamic([main/0, many_fact/1, fact/2, fact/3]).

bench :-
  many_fact(350).
  
many_fact(0).
many_fact(N) :-
  N>0,
	fact(1000, _),
  N1 is N-1,
  many_fact(N1).

fact(0, 1).
fact(N, F) :-
  N>0,
  fact(N, 1, F).

fact(N, F, F) :-
  N =< 1.
fact(N, A, F) :-
  N>1,
  F1 is N*A,
  N1 is N-1,
  fact(N1, F1, F).