:- hypothetical(true).
:- weak_unification(a3).
:- indexing(false).
%:-module(program,[]).

%:-dynamic([main/0, many_fact/3, fact/2, fact/3]).

bench :-
  many_fact(1000,[],_).
	  
many_fact(0,L,L).
many_fact(N,Li,[F|L]) :-
  N>0,
  ((f(F) :- fact(N,F))
   =>
   f(_)),
  N1 is N-1,
  many_fact(N1,Li,L).

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

